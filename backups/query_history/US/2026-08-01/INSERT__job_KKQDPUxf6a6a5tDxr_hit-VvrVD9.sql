-- job_id: job_KKQDPUxf6a6a5tDxr_hit-VvrVD9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:14.772000+00:00
-- started: 2026-08-01T05:46:14.953000+00:00
-- ended: 2026-08-01T05:46:15.707000+00:00

INSERT INTO `MS_Ads_FS_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_FS_GeographicPerformanceDailyReport_2ef952b5_0b41_44db_9196_1f072687fbbb` AS main_table_alias)
