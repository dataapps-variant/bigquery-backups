-- job_id: scheduled_query_6a6a0bc6-0000-2191-a113-fc4116926309
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-28T08:00:03.769000+00:00
-- started: 2026-07-28T08:00:04.106000+00:00
-- ended: 2026-07-28T08:00:05.076000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Utilities.Discounts_BQ_90days` AS
SELECT
  App_Name,
  Product_Name_Final_Merged,
  SUM(Plan_Price_Net_of_Tax_USD) AS Plan_Price_Net_of_Tax_USD,
  SUM(Order_Price_Net_of_Tax_USD) AS Order_Price_Net_of_Tax_USD
FROM
  `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
WHERE
  Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY)
GROUP BY
  App_Name,
  Product_Name_Final_Merged
ORDER BY
  App_Name,
  Product_Name_Final_Merged
