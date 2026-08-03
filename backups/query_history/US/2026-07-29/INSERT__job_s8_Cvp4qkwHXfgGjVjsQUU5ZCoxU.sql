-- job_id: job_s8_Cvp4qkwHXfgGjVjsQUU5ZCoxU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:00.240000+00:00
-- started: 2026-07-29T05:46:00.452000+00:00
-- ended: 2026-07-29T05:46:01.249000+00:00

INSERT INTO `MS_Ads_AT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_AT_CampaignPerformanceDailyReport_668246f0_faea_440f_a1ff_2e6b28619ed8` AS main_table_alias)
