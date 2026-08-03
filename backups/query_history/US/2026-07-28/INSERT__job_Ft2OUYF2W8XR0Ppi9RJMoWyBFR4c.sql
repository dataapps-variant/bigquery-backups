-- job_id: job_Ft2OUYF2W8XR0Ppi9RJMoWyBFR4c
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:15.749000+00:00
-- started: 2026-07-28T05:46:15.898000+00:00
-- ended: 2026-07-28T05:46:16.734000+00:00

INSERT INTO `MS_Ads_CL_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CL_CampaignPerformanceDailyReport_a59c65aa_4b57_48d1_a6f2_dee474fe0d1d` AS main_table_alias)
