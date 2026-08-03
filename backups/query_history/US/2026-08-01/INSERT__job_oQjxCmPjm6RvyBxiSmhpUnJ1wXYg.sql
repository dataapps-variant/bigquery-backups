-- job_id: job_oQjxCmPjm6RvyBxiSmhpUnJ1wXYg
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:14.446000+00:00
-- started: 2026-08-01T05:46:14.602000+00:00
-- ended: 2026-08-01T05:46:15.368000+00:00

INSERT INTO `MS_Ads_JF_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_JF_GeographicPerformanceDailyReport_4710ec13_b1d5_4f47_b505_3b787cec7fd2` AS main_table_alias)
