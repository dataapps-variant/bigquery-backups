CREATE OR REPLACE TABLE `variant-finance-data-project.Facbook_ad_spend_data.Facebook_Ads_Daily_Check` AS
SELECT
  App_Name,
  Date,
  SUM(allocated_spend) AS total_allocated_spend
FROM `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
WHERE Date >= "2026-05-01"
  AND allocated_spend > 0
  AND Channel_name = "Facebook_Ads"
GROUP BY App_Name, Date;
