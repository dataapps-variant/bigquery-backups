-- job_id: job_S4YG4bgtdx1qvvTvFivQfHAIEuik
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:07.756000+00:00
-- started: 2026-07-28T05:46:07.949000+00:00
-- ended: 2026-07-28T05:46:09.867000+00:00

INSERT INTO `MS_Ads_CN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CN_CampaignPerformanceDailyReport_3077a935_d336_478c_9555_9c83dbe89113` AS main_table_alias)
