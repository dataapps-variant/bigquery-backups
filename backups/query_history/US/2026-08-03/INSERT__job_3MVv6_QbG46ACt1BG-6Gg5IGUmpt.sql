-- job_id: job_3MVv6_QbG46ACt1BG-6Gg5IGUmpt
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:03.547000+00:00
-- started: 2026-08-03T05:46:03.720000+00:00
-- ended: 2026-08-03T05:46:04.564000+00:00

INSERT INTO `MS_Ads_EN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_EN_GeographicPerformanceDailyReport_6e5a9972_bc32_489d_9389_fd2202a1cf0e` AS main_table_alias)
