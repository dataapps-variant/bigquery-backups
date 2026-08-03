-- job_id: job_KJ3Wokj3Or_dXXIUQxpopSINGIq9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:04.047000+00:00
-- started: 2026-07-31T05:46:04.248000+00:00
-- ended: 2026-07-31T05:46:04.995000+00:00

INSERT INTO `MS_Ads_CT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CT_CampaignPerformanceDailyReport_defb0851_99ab_4ad2_9757_47c2fc5b9e92` AS main_table_alias)
