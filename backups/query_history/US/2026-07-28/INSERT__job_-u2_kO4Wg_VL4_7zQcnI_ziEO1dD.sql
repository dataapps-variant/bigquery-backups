-- job_id: job_-u2_kO4Wg_VL4_7zQcnI_ziEO1dD
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:03.027000+00:00
-- started: 2026-07-28T05:46:03.186000+00:00
-- ended: 2026-07-28T05:46:04.118000+00:00

INSERT INTO `MS_Ads_RT_AdPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `AdGroupId`, `AdId`, `AdType`, `CustomerId`, `CurrencyCode`, `DestinationUrl`, `DisplayUrl`, `FinalAppUrl`, `FinalMobileUrl`, `FinalUrl`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`AdGroupId`,main_table_alias.`AdId`,main_table_alias.`AdType`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`DestinationUrl`,main_table_alias.`DisplayUrl`,main_table_alias.`FinalAppUrl`,main_table_alias.`FinalMobileUrl`,main_table_alias.`FinalUrl`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_RT_AdPerformanceDailyReport_3704f85b_d05f_4feb_8a59_a2c1aa04946b` AS main_table_alias)
