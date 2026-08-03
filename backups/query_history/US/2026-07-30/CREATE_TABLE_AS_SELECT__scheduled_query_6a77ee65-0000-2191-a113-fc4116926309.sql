-- job_id: scheduled_query_6a77ee65-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-30T08:30:04.072000+00:00
-- started: 2026-07-30T08:30:04.526000+00:00
-- ended: 2026-07-30T08:30:07.097000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.User_Count` AS
WITH base AS (
  SELECT
    Date_of_Sale AS Report_Date,
    CASE
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
      WHEN App_Name = 'CT' AND Spend_Country_Code_AFID != 'JP' THEN 'CT-Non-JP'
      ELSE App_Name
    END AS App_Name,
    AFID_CHANNEL,
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
    PARTITION BY App_Name, AFID_CHANNEL, Product_Name_Final_Merged, Billing_Cycle_Updated
    ORDER BY UNIX_DATE(Report_Date)
    RANGE BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS T7D_Avg_New_Users
FROM base
