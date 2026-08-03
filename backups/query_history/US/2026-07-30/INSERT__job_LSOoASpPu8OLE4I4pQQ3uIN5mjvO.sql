-- job_id: job_LSOoASpPu8OLE4I4pQQ3uIN5mjvO
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:05.116000+00:00
-- started: 2026-07-30T05:46:05.325000+00:00
-- ended: 2026-07-30T05:46:06.053000+00:00

INSERT INTO `MS_Ads_RT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_RT_CampaignPerformanceDailyReport_9b8d76b9_8d4c_4fa0_8f56_44a8a2c6f7bb` AS main_table_alias)
