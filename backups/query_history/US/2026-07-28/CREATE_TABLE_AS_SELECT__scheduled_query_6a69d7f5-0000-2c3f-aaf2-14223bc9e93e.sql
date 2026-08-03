-- job_id: scheduled_query_6a69d7f5-0000-2c3f-aaf2-14223bc9e93e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T08:30:02.455000+00:00
-- started: 2026-07-28T08:30:02.719000+00:00
-- ended: 2026-07-28T08:30:08.085000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.User_Count_AFID` AS
WITH base AS (
  SELECT
    Date_of_Sale AS Report_Date,
    CASE
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END AS App_Name,
    AFID,
    Product_Name_Final_Merged,
    Billing_Cycle_Updated,
    COUNT(DISTINCT Updated_Cust_ID) AS BC_New_Users
  FROM
    `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE
    Date_of_Sale > '2024-12-31'
    AND Trial_Type != 'SS'
  GROUP BY ALL
)
SELECT
  *,
  AVG(BC_New_Users) OVER (
    PARTITION BY App_Name, AFID, Product_Name_Final_Merged, Billing_Cycle_Updated
    ORDER BY UNIX_DATE(Report_Date)
    RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS T7D_Avg_New_Users
FROM base;
