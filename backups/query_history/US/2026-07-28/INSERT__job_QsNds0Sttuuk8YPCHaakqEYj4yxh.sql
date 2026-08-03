-- job_id: job_QsNds0Sttuuk8YPCHaakqEYj4yxh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:07.852000+00:00
-- started: 2026-07-28T05:46:08.007000+00:00
-- ended: 2026-07-28T05:46:08.943000+00:00

INSERT INTO `MS_Ads_JF_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_JF_CampaignPerformanceDailyReport_d3522266_f0c4_452e_b54f_b8f43107f806` AS main_table_alias)
