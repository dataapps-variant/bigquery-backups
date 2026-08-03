-- job_id: job_4ZFptVDMse5DdOmbmWcBXFdesp8Q
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:08.214000+00:00
-- started: 2026-07-30T05:46:08.380000+00:00
-- ended: 2026-07-30T05:46:11.220000+00:00

INSERT INTO `MS_Ads_FS_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_FS_CampaignPerformanceDailyReport_d7449418_7c56_42a3_92b7_8bdc4406b18f` AS main_table_alias)
