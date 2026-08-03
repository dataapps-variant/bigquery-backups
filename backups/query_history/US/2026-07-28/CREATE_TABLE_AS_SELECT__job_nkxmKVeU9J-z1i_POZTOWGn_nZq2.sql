-- job_id: job_nkxmKVeU9J-z1i_POZTOWGn_nZq2
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T15:48:43.259000+00:00
-- started: 2026-07-28T15:48:43.630000+00:00
-- ended: 2026-07-28T15:48:45.474000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Extension_Scenario_Retention.Dim_Table_Extension_Refund_Scenario` AS

WITH

inputs AS (
  SELECT
    Input_ID, Entity, Plan_Code,
    Refund_Curve,
    Extension_Scenarios_Refunds
  FROM `variant-finance-data-project.R100.R100_Inputs_Full`
  WHERE Inputs_to_Process = TRUE
),

latest_date AS (
  SELECT MAX(Reporting_Date) AS max_date
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
  WHERE Metric_Name = '06. Refund Rate'
),

icarus_long AS (
  SELECT
    Plan_Name, Cohort, Active_Inactive, bc_col,
    SAFE_CAST(REPLACE(bc_value, '%', '') AS FLOAT64) / 100.0 AS refund_rate
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
  UNPIVOT (
    bc_value FOR bc_col IN (
      BC0 AS 'BC0', BC1 AS 'BC1', BC2 AS 'BC2', BC3 AS 'BC3',
      BC4 AS 'BC4', BC5 AS 'BC5', BC6 AS 'BC6', BC7 AS 'BC7',
      BC8 AS 'BC8', BC9 AS 'BC9', BC10 AS 'BC10', BC11 AS 'BC11',
      BC12 AS 'BC12'
    )
  )
  WHERE Metric_Name = '06. Refund Rate'
    AND Table_Type = 'Regular'
    AND Reporting_Date = (SELECT max_date FROM latest_date)
),

icarus_parsed AS (
  SELECT Plan_Name, Cohort, Active_Inactive,
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS Billing_Cycle,
    refund_rate
  FROM icarus_long
  WHERE refund_rate IS NOT NULL
),

cohort_priority AS (
  SELECT Plan_Name, Cohort, Active_Inactive, Billing_Cycle, refund_rate,
    ROW_NUMBER() OVER (
      PARTITION BY Plan_Name, Billing_Cycle
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
  SELECT Plan_Name,
    CONCAT(Active_Inactive, ' ', Cohort) AS icarus_source,
    Billing_Cycle, refund_rate
  FROM cohort_priority WHERE rn = 1
),

last_icarus_bc AS (
  SELECT Plan_Name,
    MAX(Billing_Cycle) AS max_bc,
    ARRAY_AGG(refund_rate ORDER BY Billing_Cycle DESC LIMIT 1)[OFFSET(0)] AS last_refund
  FROM best_icarus
  GROUP BY Plan_Name
),

extension_parsed AS (
  SELECT
    Refund_Scenario_Name,
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS Billing_Cycle,
    refund_ext_rate
  FROM `variant-finance-data-project.Extension_Refunds_Scenarios.Extension_Refunds_Scenarios`
  UNPIVOT (
    refund_ext_rate FOR bc_col IN (
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
    i.Input_ID, i.Entity, i.Plan_Code, i.Refund_Curve,
    i.Extension_Scenarios_Refunds,
    b.bc AS Billing_Cycle,
    ic.refund_rate AS icarus_refund,
    ic.icarus_source,
    ext.refund_ext_rate AS extension_refund,
    lib.max_bc AS icarus_max_bc,
    lib.last_refund AS icarus_last_refund
  FROM inputs i
  CROSS JOIN bc_range b
  LEFT JOIN best_icarus ic
    ON ic.Plan_Name = i.Refund_Curve AND ic.Billing_Cycle = b.bc
  LEFT JOIN last_icarus_bc lib
    ON lib.Plan_Name = i.Refund_Curve
  LEFT JOIN extension_parsed ext
    ON ext.Refund_Scenario_Name = i.Extension_Scenarios_Refunds
    AND ext.Billing_Cycle = b.bc
),

final_calc AS (
  SELECT
    Input_ID, Entity, Plan_Code, Refund_Curve,
    Extension_Scenarios_Refunds, Billing_Cycle,
    icarus_source,
    CASE
      WHEN icarus_refund IS NOT NULL THEN icarus_refund
      WHEN Billing_Cycle > COALESCE(icarus_max_bc, -1)
        AND icarus_last_refund IS NOT NULL THEN
        icarus_last_refund * EXP(
          SUM(
            CASE
              WHEN Billing_Cycle > icarus_max_bc
              THEN LN(GREATEST(1.0 + COALESCE(extension_refund, 0), 0.001))
              ELSE 0
            END
          ) OVER (
            PARTITION BY Input_ID
            ORDER BY Billing_Cycle
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          )
        )
      ELSE NULL
    END AS final_refund,
    CASE
      WHEN icarus_refund IS NOT NULL THEN CONCAT('Icarus: ', icarus_source)
      WHEN Billing_Cycle > COALESCE(icarus_max_bc, -1)
        AND icarus_last_refund IS NOT NULL THEN 'Extension'
      ELSE 'No Data'
    END AS Source
  FROM combined
)

SELECT
  Input_ID, Entity, Plan_Code, Refund_Curve,
  Extension_Scenarios_Refunds, Billing_Cycle,
  CONCAT(FORMAT('%.2f', final_refund * 100), '%') AS Final_Refund_Pct,
  Source
FROM final_calc
WHERE final_refund IS NOT NULL
ORDER BY Input_ID, Billing_Cycle
