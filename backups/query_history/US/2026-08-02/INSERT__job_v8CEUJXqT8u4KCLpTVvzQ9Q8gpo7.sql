-- job_id: job_v8CEUJXqT8u4KCLpTVvzQ9Q8gpo7
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:00.851000+00:00
-- started: 2026-08-02T05:46:01.017000+00:00
-- ended: 2026-08-02T05:46:01.745000+00:00

INSERT INTO `MS_Ads_JF_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_JF_CampaignPerformanceDailyReport_fbd82ea4_9f43_48bf_a399_1a5c43c30a0d` AS main_table_alias)
