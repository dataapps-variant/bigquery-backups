-- job_id: job_ddwjl2lBAeIeMlvb7JnONgKlQIIl
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:01.971000+00:00
-- started: 2026-07-31T05:46:02.196000+00:00
-- ended: 2026-07-31T05:46:02.939000+00:00

INSERT INTO `MS_Ads_IQ_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_CampaignPerformanceDailyReport_6b8b4fd0_ecea_43b0_8f73_2a504418b85e` AS main_table_alias)
