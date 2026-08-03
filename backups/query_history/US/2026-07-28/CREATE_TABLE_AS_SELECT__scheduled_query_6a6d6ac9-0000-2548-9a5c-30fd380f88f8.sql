-- job_id: scheduled_query_6a6d6ac9-0000-2548-9a5c-30fd380f88f8
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T08:15:05.602000+00:00
-- started: 2026-07-28T08:15:05.857000+00:00
-- ended: 2026-07-28T08:15:12.300000+00:00

-- Create or Replace Table: CPA Pivot Table with MTD Metrics
-- Contains Daily + Month-to-Date User Metrics, Ad Spend, and CAC
-- Changes: Added Entity_Name, CT Split, NT BC=1 as Trial
-- Entity_Name from User table only; Spend joins on Date + App + Channel
-- AFID_CHANNEL = 99 → 'Organic'
-- UPDATED: Removed Is_Chargeback, Is_Void, Is_Refund filters to calculate gross CAC

CREATE OR REPLACE TABLE `variant-finance-data-project.Daedalus.CPA` AS

WITH user_metrics AS (
  SELECT 
    s.Entity_Name,
    s.Date_of_Sale AS Report_Date,
    CASE 
      WHEN s.App_Name = 'CT' AND s.Bill_Country_Code = 'JP' THEN 'CT-JP'
      WHEN s.App_Name = 'CT' AND (s.Bill_Country_Code != 'JP' OR s.Bill_Country_Code IS NULL) THEN 'CT-Non-JP'
      ELSE s.App_Name
    END AS App_Name,
    CASE 
      WHEN s.AFID_CHANNEL = 99 THEN 'Organic'
      ELSE COALESCE(dim.Channel_Name, 'Unknown')
    END AS Channel_Name,
    
    COUNT(DISTINCT CASE 
      WHEN (
        (s.Billing_Cycle_Updated = 0 AND RIGHT(s.Product_Name_Final, 2) != 'SS')
        OR 
        (s.Billing_Cycle_Updated = 1 AND RIGHT(s.Product_Name_Final, 2) = 'NT')
      )
      THEN s.Order_Id 
    END) AS Trial_Users,
    
    COUNT(DISTINCT CASE 
      WHEN (
        (s.Billing_Cycle_Updated >= 1 AND RIGHT(s.Product_Name_Final, 2) != 'SS' AND RIGHT(s.Product_Name_Final, 2) != 'NT')
        OR 
        (s.Billing_Cycle_Updated >= 2 AND RIGHT(s.Product_Name_Final, 2) = 'NT')
      )
      THEN s.Order_Id 
    END) AS New_Subs_Users,
    
    COUNT(DISTINCT CASE 
      WHEN RIGHT(s.Product_Name_Final, 2) = 'SS'
      THEN s.Order_Id 
    END) AS Single_Sale_Users
    
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_AFID` dim
    ON s.AFID_CHANNEL = dim.afid_channel
  GROUP BY 
    s.Entity_Name,
    s.Date_of_Sale,
    CASE 
      WHEN s.App_Name = 'CT' AND s.Bill_Country_Code = 'JP' THEN 'CT-JP'
      WHEN s.App_Name = 'CT' AND (s.Bill_Country_Code != 'JP' OR s.Bill_Country_Code IS NULL) THEN 'CT-Non-JP'
      ELSE s.App_Name
    END,
    CASE 
      WHEN s.AFID_CHANNEL = 99 THEN 'Organic'
      ELSE COALESCE(dim.Channel_Name, 'Unknown')
    END
),

spend_metrics AS (
  SELECT 
    Date AS Report_Date,
    App_Name,
    Channel_name AS Channel_Name,
    SUM(allocated_spend) AS Ad_Spend
  FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
  GROUP BY 
    Date,
    App_Name,
    Channel_name
),

daily_metrics AS (
  SELECT 
    u.Entity_Name,
    COALESCE(u.Report_Date, sp.Report_Date) AS Report_Date,
    COALESCE(u.App_Name, sp.App_Name) AS App_Name,
    COALESCE(u.Channel_Name, sp.Channel_Name) AS Channel_Name,
    COALESCE(u.Trial_Users, 0) AS Trial_Users,
    COALESCE(u.New_Subs_Users, 0) AS New_Subs_Users,
    COALESCE(u.Single_Sale_Users, 0) AS Single_Sale_Users,
    COALESCE(u.Trial_Users, 0) + COALESCE(u.New_Subs_Users, 0) + COALESCE(u.Single_Sale_Users, 0) AS Total,
    COALESCE(sp.Ad_Spend, 0) AS Ad_Spend,
    CASE 
      WHEN COALESCE(u.Trial_Users, 0) > 0 
      THEN COALESCE(sp.Ad_Spend, 0) / u.Trial_Users
      ELSE NULL 
    END AS CAC
  FROM user_metrics u
  LEFT JOIN spend_metrics sp
    ON u.Report_Date = sp.Report_Date
    AND u.App_Name = sp.App_Name
    AND u.Channel_Name = sp.Channel_Name
)

SELECT 
  Entity_Name,
  Report_Date As Date,
  App_Name,
  Channel_Name,
  Trial_Users,
  New_Subs_Users,
  Single_Sale_Users,
  Total,
  CAST(Ad_Spend AS INT64) AS Ad_Spend,
  ROUND(CAC, 2) AS CAC,
  
  SUM(Trial_Users) OVER (
    PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
    ORDER BY Report_Date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS Trial_Users_MTD,
  
  SUM(New_Subs_Users) OVER (
    PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
    ORDER BY Report_Date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS New_Subs_Users_MTD,
  
  SUM(Single_Sale_Users) OVER (
    PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
    ORDER BY Report_Date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS Single_Sale_Users_MTD,
  
  SUM(Trial_Users) OVER (
    PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
    ORDER BY Report_Date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) 
  + SUM(New_Subs_Users) OVER (
    PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
    ORDER BY Report_Date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) 
  + SUM(Single_Sale_Users) OVER (
    PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
    ORDER BY Report_Date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS Total_MTD,
  
  CAST(SUM(Ad_Spend) OVER (
    PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
    ORDER BY Report_Date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS INT64) AS Ad_Spend_MTD,

  
  ROUND(
    CASE 
      WHEN SUM(Trial_Users) OVER (
      PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
      ORDER BY Report_Date
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) > 0 
    THEN SUM(Ad_Spend) OVER (
      PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
      ORDER BY Report_Date
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) / SUM(Trial_Users) OVER (
      PARTITION BY EXTRACT(YEAR FROM Report_Date), EXTRACT(MONTH FROM Report_Date), Entity_Name, App_Name, Channel_Name 
      ORDER BY Report_Date
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )
    ELSE NULL 
  END , 2) AS CAC_MTD

FROM daily_metrics;
