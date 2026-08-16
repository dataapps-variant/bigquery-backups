CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Retention_Curves` AS

WITH

latest_date AS (
  SELECT MAX(Reporting_Date) AS max_date
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
  WHERE Metric_Name = '05. Gross Retention Rate'
),

icarus_long AS (
  SELECT
    Plan_Name, App_Name, Cohort, Active_Inactive, bc_col,
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
  SELECT
    Plan_Name, App_Name, Cohort, Active_Inactive,
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS bc_level,
    retention_rate
  FROM icarus_long
  WHERE retention_rate IS NOT NULL
),

cohort_priority AS (
  SELECT
    Plan_Name, App_Name, Cohort, Active_Inactive, bc_level, retention_rate,
    ROW_NUMBER() OVER (
      PARTITION BY Plan_Name, bc_level
      ORDER BY
        CASE
          WHEN Active_Inactive = 'Active' AND Cohort = '7K_30D' THEN 1
          WHEN Active_Inactive = 'Active' AND Cohort = '7K' THEN 2
          WHEN Active_Inactive = 'Inactive' AND Cohort = '7K' THEN 3
          ELSE 4
        END
    ) AS rn
  FROM icarus_parsed
  WHERE NOT (Active_Inactive = 'Inactive' AND Cohort = '7K_30D')
),

best_icarus AS (
  SELECT
    Plan_Name, App_Name,
    CONCAT(Active_Inactive, ' ', Cohort) AS icarus_source,
    bc_level, retention_rate
  FROM cohort_priority WHERE rn = 1
),

all_icarus_plans AS (
  SELECT DISTINCT Plan_Name, App_Name
  FROM best_icarus
),

last_icarus_bc AS (
  SELECT Plan_Name,
    MAX(bc_level) AS max_bc,
    ARRAY_AGG(retention_rate ORDER BY bc_level DESC LIMIT 1)[OFFSET(0)] AS last_retention
  FROM best_icarus
  GROUP BY Plan_Name
),

r100_extension_map AS (
  SELECT
    Retention_Curve,
    Extension_Scenarios_Retentions,
    ROW_NUMBER() OVER (
      PARTITION BY Retention_Curve
      ORDER BY Loaded_At DESC
    ) AS rn
  FROM `variant-finance-data-project.R100.R100_Inputs_Full`
  WHERE Inputs_to_Process = TRUE
    AND Extension_Scenarios_Retentions IS NOT NULL
    AND TRIM(Extension_Scenarios_Retentions) != ''
),

extension_map AS (
  SELECT Retention_Curve, Extension_Scenarios_Retentions
  FROM r100_extension_map
  WHERE rn = 1
),

extension_parsed AS (
  SELECT
    Churn_Curve_Name,
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS bc_level,
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
    p.Plan_Name,
    p.App_Name,
    b.bc AS bc_level,
    ic.retention_rate AS icarus_retention,
    ic.icarus_source,
    ext_churn.churn_rate AS extension_churn,
    lib.max_bc AS icarus_max_bc,
    lib.last_retention AS icarus_last_retention,
    em.Extension_Scenarios_Retentions
  FROM all_icarus_plans p
  CROSS JOIN bc_range b
  LEFT JOIN best_icarus ic
    ON ic.Plan_Name = p.Plan_Name AND ic.bc_level = b.bc
  LEFT JOIN last_icarus_bc lib
    ON lib.Plan_Name = p.Plan_Name
  LEFT JOIN extension_map em
    ON em.Retention_Curve = p.Plan_Name
  LEFT JOIN extension_parsed ext_churn
    ON ext_churn.Churn_Curve_Name = em.Extension_Scenarios_Retentions
    AND ext_churn.bc_level = b.bc
),

final_calc AS (
  SELECT
    App_Name,
    Plan_Name,
    bc_level,
    CASE
      WHEN icarus_retention IS NOT NULL THEN icarus_retention
      WHEN bc_level > COALESCE(icarus_max_bc, -1)
        AND icarus_last_retention IS NOT NULL
        AND Extension_Scenarios_Retentions IS NOT NULL THEN
        icarus_last_retention * EXP(
          SUM(
            CASE
              WHEN bc_level > icarus_max_bc
              THEN LN(GREATEST(1.0 - COALESCE(extension_churn, 0), 0.001))
              ELSE 0
            END
          ) OVER (
            PARTITION BY Plan_Name
            ORDER BY bc_level
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          )
        )
      ELSE NULL
    END AS retention_pct,
    CASE
      WHEN icarus_retention IS NOT NULL THEN CONCAT('Icarus: ', icarus_source)
      WHEN bc_level > COALESCE(icarus_max_bc, -1)
        AND icarus_last_retention IS NOT NULL
        AND Extension_Scenarios_Retentions IS NOT NULL THEN CONCAT('Extension: ', Extension_Scenarios_Retentions)
      ELSE 'No Data'
    END AS Source
  FROM combined
)

SELECT
  App_Name AS Entity,
  Plan_Name AS Curve_Name,
  bc_level,
  ROUND(retention_pct, 4) AS retention_pct,
  Source,
  CURRENT_TIMESTAMP() AS Loaded_At
FROM final_calc
WHERE retention_pct IS NOT NULL
ORDER BY Entity, Curve_Name, bc_level
