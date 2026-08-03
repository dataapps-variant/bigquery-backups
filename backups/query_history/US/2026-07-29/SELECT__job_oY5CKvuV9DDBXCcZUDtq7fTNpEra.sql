-- job_id: job_oY5CKvuV9DDBXCcZUDtq7fTNpEra
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T15:01:17.291000+00:00
-- started: 2026-07-29T15:01:17.431000+00:00
-- ended: 2026-07-29T15:01:18.982000+00:00

WITH

inputs AS (
  SELECT
    Input_ID, Entity, Plan_Code,
    CASE
      WHEN Plan_Code = 'PD4988MT' THEN 'PD4988PTAA'
      WHEN Plan_Code = 'PD2995MT' THEN 'PD2995STMT'
      ELSE Retention_Curve
    END AS Retention_Curve,
    Extension_Scenarios_Retentions
  FROM `variant-finance-data-project.R100.R100_Inputs_Full`
  WHERE Inputs_to_Process = TRUE
),

latest_date AS (
  SELECT MAX(Reporting_Date) AS max_date
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
  WHERE Metric_Name = '05. Gross Retention Rate'
),

icarus_long AS (
  SELECT
    Plan_Name, Cohort, bc_col,
    SAFE_CAST(REPLACE(bc_value, '%', '') AS FLOAT64) / 100.0 AS retention_rate
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
  UNPIVOT (
    bc_value FOR bc_col IN (
      BC0 AS 'BC0', BC1 AS 'BC1', BC2 AS 'BC2', BC3 AS 'BC3',
      BC4 AS 'BC4', BC5 AS 'BC5', BC6 AS 'BC6', BC7 AS 'BC7',
      BC8 AS 'BC8', BC9 AS 'BC9', BC10 AS 'BC10', BC11 AS 'BC11',
      BC12 AS 'BC12'
    )
  )
  WHERE Metric_Name = '05. Gross Retention Rate'
    AND Table_Type = 'Regular'
    AND Reporting_Date = (SELECT max_date FROM latest_date)
),

icarus_parsed AS (
  SELECT Plan_Name, Cohort,
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS bc_number,
    retention_rate
  FROM icarus_long
  WHERE retention_rate IS NOT NULL
),

cohort_priority AS (
  SELECT Plan_Name, Cohort, bc_number, retention_rate,
    ROW_NUMBER() OVER (
      PARTITION BY Plan_Name, bc_number
      ORDER BY CASE Cohort WHEN '7K_30D' THEN 1 WHEN '7K' THEN 2 ELSE 3 END
    ) AS rn
  FROM icarus_parsed
),

best_icarus AS (
  SELECT Plan_Name, Cohort AS icarus_cohort, bc_number, retention_rate
  FROM cohort_priority WHERE rn = 1
),

last_icarus_bc AS (
  SELECT Plan_Name,
    MAX(bc_number) AS max_bc,
    ARRAY_AGG(retention_rate ORDER BY bc_number DESC LIMIT 1)[OFFSET(0)] AS last_retention
  FROM best_icarus
  GROUP BY Plan_Name
),

extension_parsed AS (
  SELECT
    Churn_Curve_Name,
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS bc_number,
    churn_rate
  FROM `variant-finance-data-project.Extension_Scenario_Retention.Extension_Retentions_Scenarios`
  UNPIVOT (
    churn_rate FOR bc_col IN (
      BC0 AS 'BC0', BC1 AS 'BC1', BC2 AS 'BC2', BC3 AS 'BC3',
      BC4 AS 'BC4', BC5 AS 'BC5', BC6 AS 'BC6', BC7 AS 'BC7',
      BC8 AS 'BC8', BC9 AS 'BC9', BC10 AS 'BC10', BC11 AS 'BC11',
      BC12 AS 'BC12', BC13 AS 'BC13', BC14 AS 'BC14', BC15 AS 'BC15',
      BC16 AS 'BC16', BC17 AS 'BC17', BC18 AS 'BC18', BC19 AS 'BC19',
      BC20 AS 'BC20', BC21 AS 'BC21', BC22 AS 'BC22', BC23 AS 'BC23',
      BC24 AS 'BC24', BC25 AS 'BC25', BC26 AS 'BC26', BC27 AS 'BC27',
      BC28 AS 'BC28', BC29 AS 'BC29', BC30 AS 'BC30', BC31 AS 'BC31',
      BC32 AS 'BC32', BC33 AS 'BC33', BC34 AS 'BC34', BC35 AS 'BC35',
      BC36 AS 'BC36'
    )
  )
),

bc_range AS (
  SELECT bc FROM UNNEST(GENERATE_ARRAY(0, 36)) AS bc
),

combined AS (
  SELECT
    i.Input_ID, i.Entity, i.Plan_Code, i.Retention_Curve,
    i.Extension_Scenarios_Retentions,
    b.bc AS bc_number,
    ic.retention_rate AS icarus_retention,
    ext.churn_rate AS extension_churn,
    lib.max_bc AS icarus_max_bc,
    lib.last_retention AS icarus_last_retention
  FROM inputs i
  CROSS JOIN bc_range b
  LEFT JOIN best_icarus ic
    ON ic.Plan_Name = i.Retention_Curve AND ic.bc_number = b.bc
  LEFT JOIN last_icarus_bc lib
    ON lib.Plan_Name = i.Retention_Curve
  LEFT JOIN extension_parsed ext
    ON ext.Churn_Curve_Name = i.Extension_Scenarios_Retentions
    AND ext.bc_number = b.bc
),

final_calc AS (
  SELECT
    Input_ID, Entity, Plan_Code, Retention_Curve,
    Extension_Scenarios_Retentions, bc_number,
    CASE
      WHEN icarus_retention IS NOT NULL THEN icarus_retention
      WHEN bc_number > COALESCE(icarus_max_bc, -1)
        AND icarus_last_retention IS NOT NULL THEN
        icarus_last_retention * EXP(
          SUM(
            CASE
              WHEN bc_number > icarus_max_bc
              THEN LN(GREATEST(1.0 - COALESCE(extension_churn, 0), 0.001))
              ELSE 0
            END
          ) OVER (
            PARTITION BY Input_ID
            ORDER BY bc_number
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          )
        )
      ELSE NULL
    END AS final_retention,
    CASE
      WHEN icarus_retention IS NOT NULL THEN 'Icarus'
      WHEN bc_number > COALESCE(icarus_max_bc, -1)
        AND icarus_last_retention IS NOT NULL THEN 'Extension'
      ELSE 'No Data'
    END AS source_flag
  FROM combined
)

SELECT
  Input_ID, Entity, Plan_Code, Retention_Curve,
  Extension_Scenarios_Retentions, bc_number,
  CONCAT(CAST(ROUND(final_retention * 100, 2) AS STRING), '%') AS final_retention_pct,
  source_flag
FROM final_calc
WHERE final_retention IS NOT NULL
ORDER BY Input_ID, bc_number
