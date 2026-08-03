-- job_id: job_1GbnK-IvspZvWiRu959iQOFR0y6M
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:57.469000+00:00
-- started: 2026-08-03T05:45:57.658000+00:00
-- ended: 2026-08-03T05:45:58.449000+00:00

INSERT INTO `MS_Ads_CN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CN_CampaignPerformanceDailyReport_9a9f4130_2ff1_4751_86cf_985b800aff2e` AS main_table_alias)
