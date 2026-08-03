-- job_id: job_GI0J7p3DFyHfOQgAkaSujExdcdNz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:14.066000+00:00
-- started: 2026-07-30T05:46:14.254000+00:00
-- ended: 2026-07-30T05:46:15.109000+00:00

INSERT INTO `MS_Ads_EN_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_EN_CampaignPerformanceDailyReport_bcf84f6e_f8cf_43f5_b95d_c156e3b268dc` AS main_table_alias)
