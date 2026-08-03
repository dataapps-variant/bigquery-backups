-- job_id: job_7QVdEX491nuEXOg49E0f6VJjDXhc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:16.208000+00:00
-- started: 2026-07-28T05:46:16.372000+00:00
-- ended: 2026-07-28T05:46:17.188000+00:00

INSERT INTO `MS_Ads_FS_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_FS_GeographicPerformanceDailyReport_d7c28e73_6fe3_48ec_ae18_e9b8e6b85926` AS main_table_alias)
