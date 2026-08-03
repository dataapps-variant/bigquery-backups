-- job_id: job_Jbth7n4CBEctEahDHbY6Lpx96YgD
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:11.616000+00:00
-- started: 2026-07-29T05:46:12.097000+00:00
-- ended: 2026-07-29T05:46:18.880000+00:00

INSERT INTO `MS_Ads_FS_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_FS_CampaignPerformanceDailyReport_e4e8da71_66c9_4c62_8b1b_64b0800bbc04` AS main_table_alias)
