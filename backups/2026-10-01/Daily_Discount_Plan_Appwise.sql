CREATE OR REPLACE PROCEDURE `variant-finance-data-project.Utilities.proc_Daily_Discounts_Plan_AppWise`()
BEGIN

CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.Daily_Discounts_Plan_AppWise` AS

WITH base AS (
  SELECT
    Date_of_Sale,
    App_Name,
    CASE
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN App_Name = 'CT' THEN 'Non-JP'
      ELSE ''
    END AS Country,
    Billing_Cycle_Updated AS Billing_Cycle,
    Plan_Price_Net_of_Tax_USD,
    Order_Price_Net_of_Tax_USD
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale >= DATE_SUB(DATE '2025-01-01', INTERVAL 29 DAY)
  AND Billing_Cycle_Updated < 25
  AND App_Name IN ('EN', 'CT', 'FS', 'JF', 'PD', 'CL', 'MB')  -- ✅ kept MB
  AND Trial_Type != 'SS'                                         -- ✅ single quotes
),

output_groups AS (
  SELECT DISTINCT
    Date_of_Sale AS Date,
    App_Name,
    CASE
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
      WHEN App_Name = 'CT' THEN 'Non-JP'
      ELSE ''
    END AS Country,
    Billing_Cycle_Updated AS Billing_Cycle
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale >= DATE '2025-01-01'                        -- ✅ DATE literal
  AND Billing_Cycle_Updated < 25
  AND App_Name IN ('EN', 'CT', 'FS', 'JF', 'PD', 'CL', 'MB')  -- ✅ added MB
  AND Trial_Type != 'SS'                                         -- ✅ single quotes
),

cohort_transactions AS (
  SELECT
    g.Date,
    g.App_Name,
    g.Country,
    g.Billing_Cycle,
    b.Date_of_Sale AS Txn_Date,
    b.Plan_Price_Net_of_Tax_USD,
    b.Order_Price_Net_of_Tax_USD,
    ROW_NUMBER() OVER (
      PARTITION BY g.Date, g.App_Name, g.Country, g.Billing_Cycle
      ORDER BY b.Date_of_Sale DESC
    ) AS rn
  FROM output_groups g
  JOIN base b
    ON  b.App_Name      = g.App_Name
    AND b.Billing_Cycle = g.Billing_Cycle
    AND b.Country       = g.Country
    AND b.Date_of_Sale BETWEEN DATE_SUB(g.Date, INTERVAL 29 DAY) AND g.Date
)

SELECT
  Date,
  CASE
    WHEN App_Name = 'CT' AND Country = 'JP'     THEN 'CT-JP'
    WHEN App_Name = 'CT' AND Country = 'Non-JP' THEN 'CT-Non-JP'
    ELSE App_Name
  END                                                               AS App,
  Country,
  Billing_Cycle,
  SUM(Plan_Price_Net_of_Tax_USD)                                    AS Plan_Price,
  SUM(Order_Price_Net_of_Tax_USD)                                   AS Order_Price,
  SUM(Plan_Price_Net_of_Tax_USD) - SUM(Order_Price_Net_of_Tax_USD)  AS Discount,
  SAFE_DIVIDE(
    SUM(SUM(Plan_Price_Net_of_Tax_USD) - SUM(Order_Price_Net_of_Tax_USD))
      OVER (PARTITION BY Date, Country, App_Name, Billing_Cycle),
    SUM(SUM(Plan_Price_Net_of_Tax_USD))
      OVER (PARTITION BY Date, Country, App_Name, Billing_Cycle)
  )                                                                 AS App_Level_Disc_Perc,
  SAFE_DIVIDE(
    SUM(SUM(Plan_Price_Net_of_Tax_USD) - SUM(Order_Price_Net_of_Tax_USD))
      OVER (
        PARTITION BY Date, Country, App_Name
        ORDER BY Billing_Cycle
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ),
    SUM(SUM(Plan_Price_Net_of_Tax_USD))
      OVER (
        PARTITION BY Date, Country, App_Name
        ORDER BY Billing_Cycle
        RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      )
  )                                                                 AS App_Level_Cumulative_Disc_Perc
FROM cohort_transactions
WHERE rn <= 7000           -- ⚠️ sampled: metrics reflect most-recent 7000 rows only
GROUP BY Date, App_Name, Country, Billing_Cycle
ORDER BY Date, Billing_Cycle;

END;
