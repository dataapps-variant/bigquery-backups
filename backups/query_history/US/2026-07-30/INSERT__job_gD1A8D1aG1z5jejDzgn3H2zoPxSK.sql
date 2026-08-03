-- job_id: job_gD1A8D1aG1z5jejDzgn3H2zoPxSK
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:26.601000+00:00
-- started: 2026-07-30T05:46:26.783000+00:00
-- ended: 2026-07-30T05:46:27.524000+00:00

INSERT INTO `MS_Ads_PD_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_PD_CampaignPerformanceDailyReport_35d78135_472c_4708_b535_45e1deecff30` AS main_table_alias)
