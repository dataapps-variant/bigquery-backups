-- job_id: job_j_TJ_6GhEcz0KzipZb6b2J7_Sydv
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:05.727000+00:00
-- started: 2026-07-28T05:46:05.931000+00:00
-- ended: 2026-07-28T05:46:06.765000+00:00

INSERT INTO `MS_Ads_IQ_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_GeographicPerformanceDailyReport_a12dd0f3_02b9_46d2_9ca3_2df3757e3dc2` AS main_table_alias)
