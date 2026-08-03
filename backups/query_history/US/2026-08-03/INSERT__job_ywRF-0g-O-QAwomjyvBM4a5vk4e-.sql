-- job_id: job_ywRF-0g-O-QAwomjyvBM4a5vk4e-
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:04.229000+00:00
-- started: 2026-08-03T05:46:04.398000+00:00
-- ended: 2026-08-03T05:46:05.231000+00:00

INSERT INTO `MS_Ads_FS_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_FS_GeographicPerformanceDailyReport_84df7953_15fc_4178_a577_1aecba10162e` AS main_table_alias)
