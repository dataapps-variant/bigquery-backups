CREATE OR REPLACE VIEW `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report_enriched` AS
SELECT
  r.Day,
  r.`Campaign tracking ID`,
  r.`Campaign name`,
  d.App_Name,
  d.Entity_Name,
  r.Cost,
  r._loaded_at
FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report` AS r
LEFT JOIN `variant-finance-data-project.OpenAI_Ads.Dim_Account_Name_Map` AS d
  ON r.`Account name` = d.Account_Name;
