-- job_id: job_l3qrHzfNX5wOQUlg17saT62mKsOp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:07.798000+00:00
-- started: 2026-07-29T05:46:07.948000+00:00
-- ended: 2026-07-29T05:46:08.696000+00:00

INSERT INTO `MS_Ads_CT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CT_CampaignPerformanceDailyReport_23d9cf74_b104_4e3e_9c59_b5db9bfb20b1` AS main_table_alias)
