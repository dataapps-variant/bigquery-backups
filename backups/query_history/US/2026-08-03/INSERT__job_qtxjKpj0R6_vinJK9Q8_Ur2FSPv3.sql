-- job_id: job_qtxjKpj0R6_vinJK9Q8_Ur2FSPv3
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:56.207000+00:00
-- started: 2026-08-03T05:45:56.456000+00:00
-- ended: 2026-08-03T05:45:57.194000+00:00

INSERT INTO `MS_Ads_IQ_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_CampaignPerformanceDailyReport_9faeda56_24cb_46b3_b5bd_e1a494a02da0` AS main_table_alias)
