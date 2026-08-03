-- job_id: job_vho-XyjrAHPscrB8YNdSRCZHe1Mz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:06.313000+00:00
-- started: 2026-07-31T05:46:06.468000+00:00
-- ended: 2026-07-31T05:46:07.356000+00:00

INSERT INTO `MS_Ads_FS_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_FS_CampaignPerformanceDailyReport_dc6e0331_849d_4587_9ed4_bd8df6d91ed0` AS main_table_alias)
