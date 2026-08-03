-- job_id: job_SHAAiiIKrRPhc1BjD1c12UD6T9xo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:59.884000+00:00
-- started: 2026-08-03T05:46:00.088000+00:00
-- ended: 2026-08-03T05:46:00.904000+00:00

INSERT INTO `MS_Ads_RT_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_RT_CampaignPerformanceDailyReport_e81989b5_c2aa_4351_937b_f3b32feaded7` AS main_table_alias)
