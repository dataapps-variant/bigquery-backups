-- job_id: job_tymsdxt1L2C_bp312YcCMuHDphkf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:02.514000+00:00
-- started: 2026-08-01T05:46:02.744000+00:00
-- ended: 2026-08-01T05:46:03.681000+00:00

INSERT INTO `MS_Ads_RT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_RT_CampaignPerformanceDailyReport_2d174b75_0dfc_4fb6_8a5c_826b2c9c3cf3` AS main_table_alias)
