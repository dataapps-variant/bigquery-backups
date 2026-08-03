-- job_id: job_t6lPJLXsNmYzsi4sDhFoGOczen1r
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:57.677000+00:00
-- started: 2026-08-02T05:45:57.876000+00:00
-- ended: 2026-08-02T05:45:58.610000+00:00

INSERT INTO `MS_Ads_AT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_AT_CampaignPerformanceDailyReport_d2c648d0_5f3d_4a47_83ea_5661bf0147cc` AS main_table_alias)
