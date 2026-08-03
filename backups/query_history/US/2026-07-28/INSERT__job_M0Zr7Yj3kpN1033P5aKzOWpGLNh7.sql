-- job_id: job_M0Zr7Yj3kpN1033P5aKzOWpGLNh7
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:24.808000+00:00
-- started: 2026-07-28T05:46:24.959000+00:00
-- ended: 2026-07-28T05:46:25.791000+00:00

INSERT INTO `MS_Ads_JF_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `AllConversions`, `AllCostPerConversion`, `Clicks`, `ConversionRate`, `Conversions`, `CostPerConversion`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`AllConversions`,main_table_alias.`AllCostPerConversion`,main_table_alias.`Clicks`,main_table_alias.`ConversionRate`,main_table_alias.`Conversions`,main_table_alias.`CostPerConversion`,main_table_alias.`Spend`  FROM `MS_Ads_JF_GeographicPerformanceDailyReport_6f9de644_a6ed_4159_a940_7427409568fe` AS main_table_alias)
