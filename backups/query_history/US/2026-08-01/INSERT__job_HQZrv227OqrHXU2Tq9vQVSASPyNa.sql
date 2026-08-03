-- job_id: job_HQZrv227OqrHXU2Tq9vQVSASPyNa
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:08.290000+00:00
-- started: 2026-08-01T05:46:08.404000+00:00
-- ended: 2026-08-01T05:46:09.236000+00:00

INSERT INTO `MS_Ads_CL_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CL_CampaignPerformanceDailyReport_7ec7b734_3557_4d46_927c_f320bff2f6ee` AS main_table_alias)
