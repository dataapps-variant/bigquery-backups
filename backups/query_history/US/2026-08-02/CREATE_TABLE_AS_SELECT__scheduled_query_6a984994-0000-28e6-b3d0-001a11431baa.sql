-- job_id: scheduled_query_6a984994-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T10:30:07.868000+00:00
-- started: 2026-08-02T10:30:08.143000+00:00
-- ended: 2026-08-02T10:30:10.953000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.Marketing_Reports` AS

WITH revenue_users AS (
  SELECT
    Date_of_Sale AS Report_Date,
    Entity_Name,
    CASE 
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END AS App_Name,
    CAST(AFID_CHANNEL AS STRING) AS Channel_Code,
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
    END,
    CAST(AFID_CHANNEL AS STRING)
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
    CAST(AFID_CHANNEL AS STRING) AS Channel_Code,
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
    END,
    CAST(AFID_CHANNEL AS STRING)
),

combined_users AS (
  SELECT
    COALESCE(r.Report_Date, s.Report_Date) AS Report_Date,
    COALESCE(r.Entity_Name, s.Entity_Name) AS Entity_Name,
    COALESCE(r.App_Name, s.App_Name) AS App_Name,
    COALESCE(r.Channel_Code, s.Channel_Code) AS Channel_Code,
    COALESCE(r.Sticky_New_Users, 0) AS Daily_New_Users,
    COALESCE(r.Sticky_New_Users, 0) - COALESCE(s.SS_New_Users, 0) AS Daily_Regular_Users,
    COALESCE(s.SS_New_Users, 0) AS Daily_SS_Users
  FROM revenue_users r
  FULL OUTER JOIN single_sale_users s
    ON r.Report_Date = s.Report_Date
    AND r.Entity_Name = s.Entity_Name
    AND r.App_Name = s.App_Name
    AND r.Channel_Code = s.Channel_Code
),

spend_data AS (
  SELECT
    Date AS Report_Date,
    App_Name,
    CAST(Channel_code AS STRING) AS Channel_Code,
    SUM(allocated_spend) AS Daily_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  GROUP BY Date, App_Name, CAST(Channel_code AS STRING)
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
),

channel_lookup AS (
  SELECT DISTINCT
    CAST(CAST(Channel_code AS INT64) AS STRING) AS Channel_Code,
    Channel_name AS Channel_Name
  FROM `variant-finance-data-project.Ad_spend_data.Dim_channel_name_code_map`
)

SELECT
  COALESCE(c.Report_Date, s.Report_Date) AS Report_Date,
  COALESCE(c.Entity_Name, e.Entity_Name) AS Entity_Name,
  COALESCE(c.App_Name, s.App_Name) AS App_Name,
  COALESCE(c.Channel_Code, s.Channel_Code) AS Channel_Code,
  COALESCE(ch.Channel_Name, 'None') AS Channel_Name,
  COALESCE(c.Daily_New_Users, 0) AS Daily_New_Users,
  COALESCE(c.Daily_Regular_Users, 0) AS Daily_Regular_Users,
  COALESCE(c.Daily_SS_Users, 0) AS Daily_SS_Users,
  COALESCE(s.Daily_Spend, 0) AS Daily_Spend,
  CASE 
    WHEN COALESCE(c.Daily_New_Users, 0) = 0 THEN NULL
    ELSE COALESCE(s.Daily_Spend, 0) / c.Daily_New_Users
  END AS Daily_CPA
FROM combined_users c
FULL OUTER JOIN spend_data s
  ON c.Report_Date = s.Report_Date
  AND c.App_Name = s.App_Name
  AND c.Channel_Code = s.Channel_Code
LEFT JOIN entity_lookup e
  ON COALESCE(c.App_Name, s.App_Name) = e.App_Name
LEFT JOIN channel_lookup ch
  ON COALESCE(c.Channel_Code, s.Channel_Code) = ch.Channel_Code
WHERE COALESCE(c.Daily_New_Users, 0) > 0 OR COALESCE(s.Daily_Spend, 0) > 0
ORDER BY Report_Date DESC, App_Name, Channel_Code;
