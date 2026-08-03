-- job_id: job_VihxxGczw_C73kYNz2ZOGLsP8Vhk
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:01.975000+00:00
-- started: 2026-07-30T05:46:02.257000+00:00
-- ended: 2026-07-30T05:46:03.053000+00:00

INSERT INTO `MS_Ads_IQ_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_CampaignPerformanceDailyReport_a7b427c0_c0b3_4949_b3a6_1f2d6e388585` AS main_table_alias)
