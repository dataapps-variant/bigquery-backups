-- job_id: job_HcDTQGc5CVgQ-OpdzlMF8H-BUTnN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:14.790000+00:00
-- started: 2026-07-28T05:46:14.986000+00:00
-- ended: 2026-07-28T05:46:15.830000+00:00

INSERT INTO `MS_Ads_PD_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_PD_CampaignPerformanceDailyReport_73030846_c792_4ee7_aa6e_be5e5484ad6e` AS main_table_alias)
