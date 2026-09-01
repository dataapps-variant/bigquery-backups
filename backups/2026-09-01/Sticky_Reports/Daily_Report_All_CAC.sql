CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Reports.Daily_Report_All_CAC` AS

WITH new_users AS (
  SELECT
    Date_of_Sale AS date,
    App_Name,
    Entity_Name,
    AFID_CHANNEL AS channel_code,
    COUNT(DISTINCT Updated_Order_ID) AS new_users
  FROM
    `Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE
    (Trial_Type = 'NT' AND Billing_Cycle_Updated = 1)
    OR (Trial_Type <> 'NT' AND Billing_Cycle_Updated = 0)
  GROUP BY
    date,
    App_Name,
    Entity_Name,
    channel_code
),

spend AS (
  SELECT
    Date AS date,
    App_Name,
    Channel_code,
    SUM(allocated_spend) AS spend_amount
  FROM
    `Ad_spend_data.Merged_Spend_Split_TBL`
  GROUP BY
    date,
    App_Name,
    Channel_code
)

SELECT
  COALESCE(nu.date, sp.date) AS date,
  COALESCE(nu.App_Name, sp.App_Name) AS App_Name,
  nu.Entity_Name,
  COALESCE(nu.channel_code, sp.Channel_code) AS channel_code,
  COALESCE(nu.new_users, 0) AS new_users,
  COALESCE(sp.spend_amount, 0) AS spend_amount,
  SAFE_DIVIDE(sp.spend_amount, nu.new_users) AS daily_cac
FROM
  new_users nu
FULL OUTER JOIN
  spend sp
  ON nu.date = sp.date
  AND nu.App_Name = sp.App_Name
  AND nu.channel_code = sp.Channel_code
ORDER BY
  date DESC,
  App_Name,
  Entity_Name,
  channel_code;
