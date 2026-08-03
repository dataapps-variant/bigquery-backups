-- job_id: job_11_J3RmHApDWpjU5GXs0vGZ6DXKx
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:02.862000+00:00
-- started: 2026-07-31T05:46:03.047000+00:00
-- ended: 2026-07-31T05:46:03.818000+00:00

INSERT INTO `MS_Ads_RT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_RT_GeographicPerformanceDailyReport_154a5731_d212_4b82_8f7c_8ad03b74a131` AS main_table_alias)
