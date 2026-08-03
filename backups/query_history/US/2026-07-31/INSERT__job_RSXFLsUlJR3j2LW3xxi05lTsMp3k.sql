-- job_id: job_RSXFLsUlJR3j2LW3xxi05lTsMp3k
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:02.915000+00:00
-- started: 2026-07-31T05:46:03.046000+00:00
-- ended: 2026-07-31T05:46:03.765000+00:00

INSERT INTO `MS_Ads_AT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_AT_GeographicPerformanceDailyReport_9b693300_fa20_4456_bd01_c2c891f75e1a` AS main_table_alias)
