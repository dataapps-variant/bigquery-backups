-- job_id: job_LpKOGYdn78oAtv3SO38lGOa5P7ZU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:12.923000+00:00
-- started: 2026-07-28T05:46:13.114000+00:00
-- ended: 2026-07-28T05:46:14.079000+00:00

INSERT INTO `MS_Ads_EN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_EN_GeographicPerformanceDailyReport_bafbff81_63a4_46d2_8234_3f1f423637fd` AS main_table_alias)
