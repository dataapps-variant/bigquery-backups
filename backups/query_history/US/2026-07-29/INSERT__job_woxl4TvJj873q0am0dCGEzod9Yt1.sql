-- job_id: job_woxl4TvJj873q0am0dCGEzod9Yt1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:04.646000+00:00
-- started: 2026-07-29T05:46:04.815000+00:00
-- ended: 2026-07-29T05:46:05.582000+00:00

INSERT INTO `MS_Ads_IQ_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_GeographicPerformanceDailyReport_cd81e3a4_3923_49f7_b08c_2a0e305aa6b4` AS main_table_alias)
