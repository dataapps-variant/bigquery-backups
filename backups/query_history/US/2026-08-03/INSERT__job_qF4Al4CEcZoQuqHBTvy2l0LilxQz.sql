-- job_id: job_qF4Al4CEcZoQuqHBTvy2l0LilxQz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:23.651000+00:00
-- started: 2026-08-03T05:46:23.829000+00:00
-- ended: 2026-08-03T05:46:24.895000+00:00

INSERT INTO `MS_Ads_CL_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CL_CampaignPerformanceDailyReport_e7c15059_9081_4206_bb29_bbb4650122bd` AS main_table_alias)
