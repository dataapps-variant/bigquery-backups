-- job_id: scheduled_query_6a8440a8-0000-28e6-b3d0-001a11431baa
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T08:00:13.701000+00:00
-- started: 2026-07-31T08:00:13.922000+00:00
-- ended: 2026-07-31T08:00:14.839000+00:00

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
