CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.Daily_Chargebacks` AS

WITH app_name_logic AS (
  SELECT
    *,
    CASE
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' THEN 'CT-Non-JP'
      ELSE App_Name
    END AS App_Name_Adj
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Billing_Cycle_Updated <= 4
    AND App_Name NOT IN ('AT', 'IQ', 'CV', 'RT', 'RL', 'CN')
),

customers AS (
  SELECT
    Date_of_Sale AS Date,
    App_Name_Adj,
    Billing_Cycle_Updated AS BC,
    COUNT(DISTINCT Updated_Cust_ID) AS Customers,
    SUM(Order_Price_Net_of_Tax_USD) AS Order_Price_Net_of_Tax_USD
  FROM app_name_logic
  WHERE Final_Order_Status != 7
    AND Date_of_Sale >= '2025-03-01'
    AND Date_of_Sale <= '2025-05-31'
  GROUP BY 1, 2, 3
),

chargebacks AS (
  SELECT
    DATE(SAFE_CAST(Chargeback_Date AS DATETIME)) AS Date,
    App_Name_Adj,
    Billing_Cycle_Updated AS BC,
    Date_of_Sale AS Original_Date_of_Sale,
    COUNT(Updated_Cust_ID) AS Chargebacks
  FROM app_name_logic
  WHERE Is_Chargeback = '1'
    AND DATE(SAFE_CAST(Chargeback_Date AS DATETIME)) >= '2025-03-01'
    AND DATE(SAFE_CAST(Chargeback_Date AS DATETIME)) <= '2025-05-31'
  GROUP BY 1, 2, 3, 4
)

SELECT
  COALESCE(c.Date, cb.Date) AS Date,
  COALESCE(c.App_Name_Adj, cb.App_Name_Adj) AS App_Name,
  COALESCE(c.BC, cb.BC) AS BC,
  IFNULL(c.Customers, 0) AS Customers,
  IFNULL(c.Order_Price_Net_of_Tax_USD, 0) AS Order_Price_Net_of_Tax_USD,
  cb.Original_Date_of_Sale,
  IFNULL(cb.Chargebacks, 0) AS Chargebacks
FROM customers c
FULL OUTER JOIN chargebacks cb
  ON c.Date = cb.Date
  AND c.App_Name_Adj = cb.App_Name_Adj
  AND c.BC = cb.BC
ORDER BY 1, 2, 3
