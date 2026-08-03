-- job_id: job_-yWZ56aUHBK4-mJfaIlTUuM49GJr
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:06.395000+00:00
-- started: 2026-07-28T05:46:06.608000+00:00
-- ended: 2026-07-28T05:46:07.406000+00:00

INSERT INTO `MS_Ads_IQ_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_CampaignPerformanceDailyReport_bcdc7224_329e_4e6c_9454_15131b9c7b2e` AS main_table_alias)
