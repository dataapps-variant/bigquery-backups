-- job_id: scheduled_query_6a82ce98-0000-25d1-8374-d4f547f95ab8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T10:30:03.778000+00:00
-- started: 2026-07-29T10:30:04.227000+00:00
-- ended: 2026-07-29T10:30:05.946000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.Major_Metrics_Report` AS

WITH revenue_users AS (
  SELECT
    Date_of_Sale AS Report_Date,
    Entity_Name,
    CASE 
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END AS App_Name,
    SUM(Order_Price_Net_of_Tax_USD) AS Net_Revenue,
    COUNT(DISTINCT CASE 
      WHEN Trial_Type != 'NT' AND Billing_Cycle_Updated = 0 THEN Updated_Cust_ID
      WHEN Trial_Type = 'NT' AND Billing_Cycle_Updated = 1 THEN Updated_Cust_ID
    END) AS Sticky_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  GROUP BY Date_of_Sale, 
    Entity_Name,
    CASE 
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END
),

single_sale_users AS (
  SELECT
    Date_of_Sale AS Report_Date,
    Entity_Name,
    CASE 
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END AS App_Name,
    COUNT(DISTINCT CASE 
      WHEN Trial_Type != 'NT' AND Billing_Cycle_Updated = 0 THEN Updated_Cust_ID
      WHEN Trial_Type = 'NT' AND Billing_Cycle_Updated = 1 THEN Updated_Cust_ID
    END) AS SS_New_Users
  FROM `variant-finance-data-project.Sticky_Data.Sales_SS_original_API_Merged_TBL`
  GROUP BY Date_of_Sale, 
    Entity_Name,
    CASE 
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END
),

combined_users AS (
  SELECT
    COALESCE(r.Report_Date, s.Report_Date) AS Report_Date,
    COALESCE(r.Entity_Name, s.Entity_Name) AS Entity_Name,
    COALESCE(r.App_Name, s.App_Name) AS App_Name,
    COALESCE(r.Net_Revenue, 0) AS Net_Revenue,
    COALESCE(r.Sticky_New_Users, 0) AS Daily_New_Users,
    COALESCE(r.Sticky_New_Users, 0) - COALESCE(s.SS_New_Users, 0) AS Daily_Regular_Users,
    COALESCE(s.SS_New_Users, 0) AS Daily_SS_Users
  FROM revenue_users r
  FULL OUTER JOIN single_sale_users s
    ON r.Report_Date = s.Report_Date
    AND r.Entity_Name = s.Entity_Name
    AND r.App_Name = s.App_Name
),

spend_data AS (
  SELECT
    Date AS Report_Date,
    App_Name,
    SUM(allocated_spend) AS Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  GROUP BY Date, App_Name
),

entity_lookup AS (
  SELECT DISTINCT
    CASE 
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END AS App_Name,
    Entity_Name
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
)

SELECT
  COALESCE(c.Report_Date, s.Report_Date) AS Report_Date,
  COALESCE(c.Entity_Name, e.Entity_Name) AS Entity_Name,
  COALESCE(c.App_Name, s.App_Name) AS App_Name,
  COALESCE(c.Net_Revenue, 0) AS Net_Revenue,
  COALESCE(c.Daily_New_Users, 0) AS Daily_New_Users,
  COALESCE(s.Daily_Spend, 0) AS Daily_Spend,
  CASE 
    WHEN COALESCE(c.Daily_New_Users, 0) = 0 THEN NULL
    ELSE COALESCE(s.Daily_Spend, 0) / c.Daily_New_Users
  END AS Daily_CPA,
  COALESCE(c.Daily_Regular_Users, 0) AS Daily_Regular_Users,
  COALESCE(c.Daily_SS_Users, 0) AS Daily_SS_Users
FROM combined_users c
FULL OUTER JOIN spend_data s
  ON c.Report_Date = s.Report_Date
  AND c.App_Name = s.App_Name
LEFT JOIN entity_lookup e
  ON COALESCE(c.App_Name, s.App_Name) = e.App_Name
WHERE COALESCE(c.Daily_New_Users, 0) > 0 OR COALESCE(s.Daily_Spend, 0) > 0 OR COALESCE(c.Net_Revenue, 0) > 0
ORDER BY Report_Date DESC, App_Name;
