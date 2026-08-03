-- job_id: job_tDO98C9QhBbmt1H5gbrB1W7y3Xuo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:03.072000+00:00
-- started: 2026-07-28T05:46:03.340000+00:00
-- ended: 2026-07-28T05:46:04.165000+00:00

INSERT INTO `MS_Ads_RT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_RT_GeographicPerformanceDailyReport_ff86ee95_7c0e_4ae9_9d55_1f405aa6affc` AS main_table_alias)
