-- job_id: job_wIEoYy4PWpMKSSSrNeNxigOlEbno
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:02.388000+00:00
-- started: 2026-07-28T05:46:02.590000+00:00
-- ended: 2026-07-28T05:46:03.524000+00:00

INSERT INTO `MS_Ads_AT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_AT_GeographicPerformanceDailyReport_bd599af7_5acb_403e_b702_c8bd6c975bb8` AS main_table_alias)
