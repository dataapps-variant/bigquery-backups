-- job_id: job_8O318LQG8BarH6g-ULYO02ngXLUx
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:05.503000+00:00
-- started: 2026-07-31T05:46:05.710000+00:00
-- ended: 2026-07-31T05:46:06.484000+00:00

INSERT INTO `MS_Ads_PD_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_PD_CampaignPerformanceDailyReport_1392009c_505c_44c1_94d1_7c70fc69859f` AS main_table_alias)
