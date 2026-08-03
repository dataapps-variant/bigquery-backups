-- job_id: job_FzqBq2k6yAgIyaO7dVkzpkHynEDH
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:12.861000+00:00
-- started: 2026-08-01T05:46:13.062000+00:00
-- ended: 2026-08-01T05:46:13.811000+00:00

INSERT INTO `MS_Ads_JF_CampaignPerformanceDailyReport` (`Date`, `AccountId`, `AccountName`, `AccountNumber`, `CampaignId`, `CampaignName`, `CampaignType`, `BaseCampaignId`, `CustomerId`, `CurrencyCode`, `FinalUrlSuffix`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`AccountName`,main_table_alias.`AccountNumber`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`CampaignType`,main_table_alias.`BaseCampaignId`,main_table_alias.`CustomerId`,main_table_alias.`CurrencyCode`,main_table_alias.`FinalUrlSuffix`,main_table_alias.`Spend`  FROM `MS_Ads_JF_CampaignPerformanceDailyReport_86fd2eb4_049a_4c66_aa8e_db7f56ff61ca` AS main_table_alias)
