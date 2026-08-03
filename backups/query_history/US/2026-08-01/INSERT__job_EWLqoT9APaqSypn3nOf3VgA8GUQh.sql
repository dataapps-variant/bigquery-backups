-- job_id: job_EWLqoT9APaqSypn3nOf3VgA8GUQh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:45:59.500000+00:00
-- started: 2026-08-01T05:45:59.716000+00:00
-- ended: 2026-08-01T05:46:00.494000+00:00

INSERT INTO `MS_Ads_AT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_AT_GeographicPerformanceDailyReport_6bf1e98d_deb0_45d5_af5a_06dd41923604` AS main_table_alias)
