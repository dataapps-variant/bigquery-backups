-- job_id: job_QK094xLJOf9mKfSZ58PtVgk4quJ8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:08.285000+00:00
-- started: 2026-07-30T05:46:08.489000+00:00
-- ended: 2026-07-30T05:46:09.317000+00:00

INSERT INTO `MS_Ads_JF_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_JF_CampaignPerformanceDailyReport_9468f3c2_b507_4b7c_b5a4_d2b075d1d8f2` AS main_table_alias)
