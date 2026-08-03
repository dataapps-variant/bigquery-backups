-- job_id: job_uVXdvA8rfWfEsnPBNVq9NqT_NRhm
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:00.857000+00:00
-- started: 2026-08-03T05:46:01.055000+00:00
-- ended: 2026-08-03T05:46:01.919000+00:00

INSERT INTO `MS_Ads_PD_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_PD_CampaignPerformanceDailyReport_fe568a31_d4c2_4fcd_aa44_17efb3692668` AS main_table_alias)
