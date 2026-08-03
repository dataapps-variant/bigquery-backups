-- job_id: job_c8W_HkcYnhWGQ3moRj5dCvcPNF6q
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:08.713000+00:00
-- started: 2026-07-29T05:46:08.918000+00:00
-- ended: 2026-07-29T05:46:09.676000+00:00

INSERT INTO `MS_Ads_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_PD_GeographicPerformanceDailyReport_b591de05_d203_4b48_a120_2648e4a959ac` AS main_table_alias)
