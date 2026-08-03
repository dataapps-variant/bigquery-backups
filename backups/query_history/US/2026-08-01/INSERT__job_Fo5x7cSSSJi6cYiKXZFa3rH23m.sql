-- job_id: job_Fo5x7cSSSJi6cYiKXZFa3rH23m__
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:02.141000+00:00
-- started: 2026-08-01T05:46:02.348000+00:00
-- ended: 2026-08-01T05:46:03.226000+00:00

INSERT INTO `MS_Ads_CN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CN_GeographicPerformanceDailyReport_6228cebf_2ec9_4110_9dfb_efe23779cff7` AS main_table_alias)
