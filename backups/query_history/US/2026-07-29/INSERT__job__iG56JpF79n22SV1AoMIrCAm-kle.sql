-- job_id: job__iG56JpF79n22SV1AoMIrCAm-kle
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:02.063000+00:00
-- started: 2026-07-29T05:46:02.314000+00:00
-- ended: 2026-07-29T05:46:03.059000+00:00

INSERT INTO `MS_Ads_CN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_CN_CampaignPerformanceDailyReport_9d3f4cbe_e127_4d4a_a8d4_4b7b8fda71df` AS main_table_alias)
