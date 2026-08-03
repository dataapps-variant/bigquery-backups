-- job_id: job_Ci7SCuQ-OMRyMu9xzlnnuoeITESV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:57.637000+00:00
-- started: 2026-08-03T05:45:57.817000+00:00
-- ended: 2026-08-03T05:45:58.521000+00:00

INSERT INTO `MS_Ads_CN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CN_GeographicPerformanceDailyReport_c9e31997_2d7a_4705_9811_76a24ac88048` AS main_table_alias)
