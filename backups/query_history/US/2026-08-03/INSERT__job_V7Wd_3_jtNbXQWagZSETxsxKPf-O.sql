-- job_id: job_V7Wd_3_jtNbXQWagZSETxsxKPf-O
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:58.107000+00:00
-- started: 2026-08-03T05:45:58.295000+00:00
-- ended: 2026-08-03T05:45:59.079000+00:00

INSERT INTO `MS_Ads_AT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_AT_CampaignPerformanceDailyReport_9f81a12c_a5aa_4958_ba29_fa8845c850b5` AS main_table_alias)
