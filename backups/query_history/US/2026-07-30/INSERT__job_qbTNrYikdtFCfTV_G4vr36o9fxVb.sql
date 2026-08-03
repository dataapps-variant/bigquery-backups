-- job_id: job_qbTNrYikdtFCfTV_G4vr36o9fxVb
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:05.316000+00:00
-- started: 2026-07-30T05:46:05.517000+00:00
-- ended: 2026-07-30T05:46:06.426000+00:00

INSERT INTO `MS_Ads_CT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CT_CampaignPerformanceDailyReport_2c0c5aa5_2707_45bc_a3ab_1016c5772837` AS main_table_alias)
