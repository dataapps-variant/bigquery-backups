-- job_id: scheduled_query_6a8d5a79-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-01T09:00:01.687000+00:00
-- started: 2026-08-01T09:00:01.746000+00:00
-- ended: 2026-08-01T09:00:04.184000+00:00

-- ============================================================
-- LMC SS Pivot Table Script (UPDATED - Output Only Change)
-- ============================================================

DECLARE min_month DATE;
DECLARE max_month DATE;
DECLARE pivot_months STRING;
DECLARE sql_query STRING;

DECLARE data_cutoff_input DATE DEFAULT NULL;
DECLARE data_cutoff DATE;

SET data_cutoff = IFNULL(
  data_cutoff_input,
  DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 DAY)
);

SET min_month = DATE '2023-01-01';
SET max_month = DATE_TRUNC(data_cutoff, MONTH);

SET pivot_months = (
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
);

SET sql_query = CONCAT(
'''CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_SS` AS
WITH 

SS_BC0 AS (
  SELECT 
    Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_cust_ID) AS ss_bc0_users,
    CASE 
      WHEN Product_Name_Final LIKE 'CT%' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN Product_Name_Final LIKE 'CT%' THEN 'Non-JP'
      ELSE NULL
    END AS CT_Country_Group
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final, 2) = 'SS'
    AND Billing_Cycle_Updated = 0
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "''', CAST(data_cutoff AS STRING), '''"
  GROUP BY Product_Name_Final, month, CT_Country_Group
),

SS_with_Main AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    s.CT_Country_Group,
    d.Product_Name_Final_Main
  FROM SS_BC0 s
  JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_SS` d
    ON s.Product_Name_Final = d.Product_Name_Final_SS
    AND PARSE_DATE('%m-%d-%Y', s.month) BETWEEN d.Start_date AND d.End_date
),

Main_BC0 AS (
  SELECT 
    Product_Name_Final,
    FORMAT_DATE('%-m-%-d-%Y', DATE_TRUNC(Date_of_Sale, MONTH)) AS month,
    COUNT(DISTINCT Updated_cust_ID) AS main_bc0_users,
    CASE 
      WHEN Product_Name_Final LIKE 'CT%' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN Product_Name_Final LIKE 'CT%' THEN 'Non-JP'
      ELSE NULL
    END AS CT_Country_Group
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Billing_Cycle_Updated = CASE 
        WHEN RIGHT(Product_Name_Final, 2) = 'NT' THEN 1 
        ELSE 0 
      END
    AND Date_of_Sale >= '2023-01-01'
    AND Date_of_Sale <= DATE "''', CAST(data_cutoff AS STRING), '''"
  GROUP BY Product_Name_Final, month, CT_Country_Group
),

SS_Main_Combined AS (
  SELECT 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    s.CT_Country_Group,
    SUM(m.main_bc0_users) AS total_main_bc0_users
  FROM SS_with_Main s
  LEFT JOIN Main_BC0 m
    ON s.Product_Name_Final_Main = m.Product_Name_Final
    AND s.month = m.month
    AND ((s.CT_Country_Group IS NULL AND m.CT_Country_Group IS NULL)
         OR s.CT_Country_Group = m.CT_Country_Group)
  GROUP BY 
    s.Product_Name_Final,
    s.month,
    s.ss_bc0_users,
    s.CT_Country_Group
),

Ratio_Calc AS (
  SELECT 
    CASE 
      WHEN CT_Country_Group IS NOT NULL 
        THEN CONCAT(Product_Name_Final, '-', CT_Country_Group)
      ELSE Product_Name_Final
    END AS Product_Name_Final,
    month,
    ROUND(SAFE_DIVIDE(ss_bc0_users, total_main_bc0_users), 4) AS ratio
  FROM SS_Main_Combined
),

Pivoted AS (
  SELECT * FROM Ratio_Calc
  PIVOT (
    MAX(ratio) 
    FOR month IN (''', pivot_months, ''')
  )
)

SELECT
  CASE
    WHEN STRPOS(Product_Name_Final, '-') > 0 THEN
      CONCAT(
        SUBSTR(Product_Name_Final, 1, 2),
        LPAD(SUBSTR(Product_Name_Final, 3, STRPOS(Product_Name_Final, 'SS') - 3), 4, '0'),
        'SS-',
        SUBSTR(Product_Name_Final, STRPOS(Product_Name_Final, '-') + 1)
      )
    ELSE
      CONCAT(
        SUBSTR(Product_Name_Final, 1, 2),
        LPAD(SUBSTR(Product_Name_Final, 3, LENGTH(Product_Name_Final) - 4), 4, '0'),
        RIGHT(Product_Name_Final, 2)
      )
  END AS Product_Name_Final,
  * EXCEPT(Product_Name_Final)
FROM Pivoted
ORDER BY Product_Name_Final'''
);

EXECUTE IMMEDIATE sql_query;
