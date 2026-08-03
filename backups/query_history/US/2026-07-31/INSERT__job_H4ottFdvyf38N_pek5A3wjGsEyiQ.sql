-- job_id: job_H4ottFdvyf38N_pek5A3wjGsEyiQ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:03.017000+00:00
-- started: 2026-07-31T05:46:03.174000+00:00
-- ended: 2026-07-31T05:46:03.921000+00:00

INSERT INTO `MS_Ads_AT_AdPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `AdGroupId`, `AdId`, `AdType`, `CustomerId`, `CurrencyCode`, `DestinationUrl`, `DisplayUrl`, `FinalAppUrl`, `FinalMobileUrl`, `FinalUrl`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`AdGroupId`,main_table_alias.`AdId`,main_table_alias.`AdType`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`DestinationUrl`,main_table_alias.`DisplayUrl`,main_table_alias.`FinalAppUrl`,main_table_alias.`FinalMobileUrl`,main_table_alias.`FinalUrl`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_AT_AdPerformanceDailyReport_20952a78_b153_415b_9300_6239f8ca9d98` AS main_table_alias)
