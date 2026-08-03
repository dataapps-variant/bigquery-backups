-- job_id: job_Hmmqs0kkBsnEv3xP74xTOrv74sMc
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T11:22:46.302000+00:00
-- started: 2026-07-30T11:22:46.399000+00:00
-- ended: 2026-07-30T11:22:47.291000+00:00

WITH

latest_date AS (
  SELECT MAX(Reporting_Date) AS max_date
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted`
  WHERE Metric_Name = '05. Gross Retention Rate'
),

icarus_long AS (
  SELECT
    Plan_Name, Entity_Name, Cohort, Active_Inactive, bc_col,
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
    Plan_Name, Entity_Name, Cohort, Active_Inactive,
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS bc_level,
    retention_rate
  FROM icarus_long
  WHERE retention_rate IS NOT NULL
),

cohort_priority AS (
  SELECT
    Plan_Name, Entity_Name, Cohort, Active_Inactive, bc_level, retention_rate,
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
)

SELECT
  Entity_Name,
  Plan_Name,
  bc_level,
  ROUND(retention_rate, 4) AS retention_pct,
  CONCAT(Active_Inactive, ' ', Cohort) AS Source,
  CURRENT_TIMESTAMP() AS Loaded_At
FROM cohort_priority
WHERE rn = 1
ORDER BY Entity_Name, Plan_Name, bc_level
