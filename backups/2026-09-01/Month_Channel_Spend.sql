CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.Month_Channel_Spend` AS
SELECT
  FORMAT_DATE('%Y-%m', Date) AS Month,
  App_Name,
  Channel_name,
  SUM(allocated_spend) AS Amount
FROM
  `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
GROUP BY
  Month, App_Name, Channel_name
ORDER BY
  Month, App_Name, Channel_name
