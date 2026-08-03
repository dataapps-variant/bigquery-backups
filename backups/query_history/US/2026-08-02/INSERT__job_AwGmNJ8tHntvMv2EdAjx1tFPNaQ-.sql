-- job_id: job_AwGmNJ8tHntvMv2EdAjx1tFPNaQ-
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:05.107000+00:00
-- started: 2026-08-02T05:46:05.291000+00:00
-- ended: 2026-08-02T05:46:07.465000+00:00

INSERT INTO `MS_Ads_FS_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_FS_CampaignPerformanceDailyReport_8f225337_4038_45d0_9459_ff11992c8d37` AS main_table_alias)
