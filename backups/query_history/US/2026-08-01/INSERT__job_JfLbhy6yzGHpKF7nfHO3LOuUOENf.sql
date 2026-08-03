-- job_id: job_JfLbhy6yzGHpKF7nfHO3LOuUOENf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:45:59.428000+00:00
-- started: 2026-08-01T05:45:59.589000+00:00
-- ended: 2026-08-01T05:46:00.359000+00:00

INSERT INTO `MS_Ads_AT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_AT_CampaignPerformanceDailyReport_7834809d_ee68_4982_9169_08a34c4137a7` AS main_table_alias)
