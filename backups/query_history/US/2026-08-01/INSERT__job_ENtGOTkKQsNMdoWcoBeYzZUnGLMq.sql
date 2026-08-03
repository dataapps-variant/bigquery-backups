-- job_id: job_ENtGOTkKQsNMdoWcoBeYzZUnGLMq
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:12.665000+00:00
-- started: 2026-08-01T05:46:12.842000+00:00
-- ended: 2026-08-01T05:46:14.905000+00:00

INSERT INTO `MS_Ads_EN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_EN_GeographicPerformanceDailyReport_2d60736d_2dd1_400b_aa45_570925c05fdf` AS main_table_alias)
