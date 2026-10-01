DECLARE bc_columns STRING; 
DECLARE extension_bc_columns STRING; 
DECLARE query STRING; 
 
-- Dynamically get all BC columns from Icarus table 
-- Dynamically get all BC columns from Extension Refund Scenario table
SET (bc_columns, extension_bc_columns) = ( 
  SELECT AS STRUCT
    ( 
      SELECT STRING_AGG( 
        CONCAT(column_name, " AS '", column_name, "'"), 
        ', ' 
        ORDER BY CAST(REPLACE(column_name, 'BC', '') AS INT64) 
      ) 
      FROM `variant-finance-data-project.ICARUS_Multi.INFORMATION_SCHEMA.COLUMNS` 
      WHERE table_name = 'Final_Table_Formatted' 
        AND REGEXP_CONTAINS(column_name, r'^BC[0-9]+$') 
    ),
    ( 
      SELECT STRING_AGG( 
        CONCAT(column_name, " AS '", column_name, "'"), 
        ', ' 
        ORDER BY CAST(REPLACE(column_name, 'BC', '') AS INT64) 
      ) 
      FROM `variant-finance-data-project.Extension_Refunds_Scenarios.INFORMATION_SCHEMA.COLUMNS` 
      WHERE table_name = 'Extension_Refunds_Scenarios' 
        AND REGEXP_CONTAINS(column_name, r'^BC[0-9]+$') 
    )
); 
 
SET query = FORMAT(""" 
CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Refund_Curves` AS 
WITH 
 
latest_date AS ( 
  SELECT MAX(Reporting_Date) AS max_date 
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted` 
  WHERE Metric_Name = '06. Refund Rate' 
    AND Reporting_Date <= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) 
), 
 
icarus_long AS ( 
  SELECT 
    Plan_Name, 
    App_Name, 
    Cohort, 
    Active_Inactive, 
    bc_col, 
    SAFE_CAST(REPLACE(bc_value, '%%', '') AS FLOAT64) / 100.0 AS refund_rate 
  FROM `variant-finance-data-project.ICARUS_Multi.Final_Table_Formatted` 
  UNPIVOT ( 
    bc_value FOR bc_col IN ( 
      %s 
    ) 
  ) 
  WHERE Metric_Name = '06. Refund Rate' 
    AND Table_Type = 'Regular' 
    AND Reporting_Date = (SELECT max_date FROM latest_date) 
), 
 
icarus_parsed AS ( 
  SELECT 
    Plan_Name, 
    App_Name, 
    Cohort, 
    Active_Inactive, 
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS bc_level, 
    refund_rate 
  FROM icarus_long 
  WHERE refund_rate IS NOT NULL 
), 
 
cohort_priority AS ( 
  SELECT 
    Plan_Name, 
    App_Name, 
    Cohort, 
    Active_Inactive, 
    bc_level, 
    refund_rate, 
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
    Plan_Name, 
    App_Name, 
    CONCAT(Active_Inactive, ' ', Cohort) AS icarus_source, 
    bc_level, 
    refund_rate 
  FROM cohort_priority 
  WHERE rn = 1 
), 
 
all_icarus_plans AS ( 
  SELECT DISTINCT 
    Plan_Name, 
    App_Name 
  FROM best_icarus 
), 
 
last_icarus_bc AS ( 
  SELECT 
    Plan_Name, 
    MAX(bc_level) AS max_bc, 
    ARRAY_AGG( 
      refund_rate 
      ORDER BY bc_level DESC 
      LIMIT 1 
    )[OFFSET(0)] AS last_refund 
  FROM best_icarus 
  GROUP BY Plan_Name 
), 
 
r100_extension_map AS ( 
  SELECT 
    Refund_Curve, 
    Extension_Scenarios_Refunds, 
    ROW_NUMBER() OVER ( 
      PARTITION BY Refund_Curve 
      ORDER BY Loaded_At DESC 
    ) AS rn 
  FROM `variant-finance-data-project.R100.R100_Inputs_Full` 
  WHERE Inputs_to_Process = TRUE 
    AND Extension_Scenarios_Refunds IS NOT NULL 
    AND TRIM(Extension_Scenarios_Refunds) != '' 
), 
 
extension_map AS ( 
  SELECT 
    Refund_Curve, 
    Extension_Scenarios_Refunds 
  FROM r100_extension_map 
  WHERE rn = 1 
), 
 
extension_parsed AS ( 
  SELECT 
    Refund_Scenario_Name, 
    CAST(REPLACE(bc_col, 'BC', '') AS INT64) AS bc_level, 
    refund_ext_rate 
  FROM `variant-finance-data-project.Extension_Refunds_Scenarios.Extension_Refunds_Scenarios` 
  UNPIVOT ( 
    refund_ext_rate FOR bc_col IN ( 
      %s 
    ) 
  ) 
), 
 
icarus_max_bc AS ( 
  SELECT 
    MAX(bc_level) AS max_bc 
  FROM best_icarus 
), 
 
bc_range AS ( 
  SELECT 
    bc 
  FROM UNNEST( 
    GENERATE_ARRAY( 
      0, 
      GREATEST( 
        36, 
        COALESCE( 
          (SELECT max_bc FROM icarus_max_bc), 
          0 
        ) 
      ) 
    ) 
  ) AS bc 
), 
 
combined AS ( 
  SELECT 
    p.Plan_Name, 
    p.App_Name, 
    b.bc AS bc_level, 
    ic.refund_rate AS icarus_refund, 
    ic.icarus_source, 
    ext_churn.refund_ext_rate AS extension_refund, 
    lib.max_bc AS icarus_max_bc, 
    lib.last_refund AS icarus_last_refund, 
    em.Extension_Scenarios_Refunds 
  FROM all_icarus_plans p 
 
  CROSS JOIN bc_range b 
 
  LEFT JOIN best_icarus ic 
    ON ic.Plan_Name = p.Plan_Name 
    AND ic.bc_level = b.bc 
 
  LEFT JOIN last_icarus_bc lib 
    ON lib.Plan_Name = p.Plan_Name 
 
  LEFT JOIN extension_map em 
    ON em.Refund_Curve = p.Plan_Name 
 
  LEFT JOIN extension_parsed ext_churn 
    ON ext_churn.Refund_Scenario_Name = em.Extension_Scenarios_Refunds 
    AND ext_churn.bc_level = b.bc 
), 
 
final_calc AS ( 
  SELECT 
    App_Name, 
    Plan_Name, 
    bc_level, 
 
    CASE 
      WHEN icarus_refund IS NOT NULL 
      THEN icarus_refund 
 
      WHEN bc_level > COALESCE(icarus_max_bc, -1) 
        AND icarus_last_refund IS NOT NULL 
        AND Extension_Scenarios_Refunds IS NOT NULL 
      THEN 
        icarus_last_refund * EXP( 
          SUM( 
            CASE 
              WHEN bc_level > icarus_max_bc 
              THEN LN( 
                GREATEST( 
                  1.0 + COALESCE(extension_refund, 0), 
                  0.001 
                ) 
              ) 
              ELSE 0 
            END 
          ) OVER ( 
            PARTITION BY Plan_Name 
            ORDER BY bc_level 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 
          ) 
        ) 
 
      ELSE NULL 
    END AS refund_pct, 
 
    CASE 
      WHEN icarus_refund IS NOT NULL 
      THEN CONCAT( 
        'Icarus: ', 
        icarus_source 
      ) 
 
      WHEN bc_level > COALESCE(icarus_max_bc, -1) 
        AND icarus_last_refund IS NOT NULL 
        AND Extension_Scenarios_Refunds IS NOT NULL 
      THEN CONCAT( 
        'Extension: ', 
        Extension_Scenarios_Refunds 
      ) 
 
      ELSE 'No Data' 
    END AS Source 
 
  FROM combined 
) 
 
SELECT 
  App_Name AS Entity, 
  Plan_Name AS Curve_Name, 
  bc_level, 
  ROUND(refund_pct, 4) AS refund_pct, 
  Source, 
  CURRENT_TIMESTAMP() AS Loaded_At 
FROM final_calc 
WHERE refund_pct IS NOT NULL 
ORDER BY Entity, Curve_Name, bc_level 
 
""", bc_columns, extension_bc_columns); 
 
EXECUTE IMMEDIATE query;
