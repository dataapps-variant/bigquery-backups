-- job_id: job_9Zkx1ZnKHUQzhw6mcgoqePHmXsUC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:02.199000+00:00
-- started: 2026-07-29T05:46:02.384000+00:00
-- ended: 2026-07-29T05:46:03.154000+00:00

INSERT INTO `MS_Ads_CN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CN_GeographicPerformanceDailyReport_1b521915_c468_4921_975b_451b2d7b6d33` AS main_table_alias)
