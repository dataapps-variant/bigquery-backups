-- job_id: job_lIHpaFhwAphMbK7MaoHjiS2El-pF
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:15.823000+00:00
-- started: 2026-07-28T05:46:16.022000+00:00
-- ended: 2026-07-28T05:46:17.234000+00:00

INSERT INTO `MS_Ads_FS_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_FS_CampaignPerformanceDailyReport_1eb697b2_859f_4872_90e2_f4f951f0deef` AS main_table_alias)
