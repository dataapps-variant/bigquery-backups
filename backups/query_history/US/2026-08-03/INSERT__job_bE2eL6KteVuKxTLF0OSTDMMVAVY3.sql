-- job_id: job_bE2eL6KteVuKxTLF0OSTDMMVAVY3
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:00.370000+00:00
-- started: 2026-08-03T05:46:00.547000+00:00
-- ended: 2026-08-03T05:46:01.291000+00:00

INSERT INTO `MS_Ads_JF_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_JF_CampaignPerformanceDailyReport_eb1cb0c9_54a0_4a3a_a5a6_41f9b3e360c5` AS main_table_alias)
