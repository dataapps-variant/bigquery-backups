-- job_id: job_vVAuIx3ljbb9m48QDVYga_4MZ-cR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:10.121000+00:00
-- started: 2026-07-28T05:46:10.296000+00:00
-- ended: 2026-07-28T05:46:11.528000+00:00

INSERT INTO `MS_Ads_EN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_EN_CampaignPerformanceDailyReport_81720a15_809e_4f35_998d_4a63e6d28bdb` AS main_table_alias)
