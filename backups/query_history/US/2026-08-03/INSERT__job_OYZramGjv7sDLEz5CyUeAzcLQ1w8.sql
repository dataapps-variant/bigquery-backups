-- job_id: job_OYZramGjv7sDLEz5CyUeAzcLQ1w8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:03.385000+00:00
-- started: 2026-08-03T05:46:03.556000+00:00
-- ended: 2026-08-03T05:46:04.360000+00:00

INSERT INTO `MS_Ads_EN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_EN_CampaignPerformanceDailyReport_d5264351_523f_4cc5_b66e_d00a9b3054a3` AS main_table_alias)
