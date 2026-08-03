-- job_id: job_HKHuoBxLBY2HMG0xgY-FiELX-NpK
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:11.204000+00:00
-- started: 2026-07-29T05:46:11.336000+00:00
-- ended: 2026-07-29T05:46:12.098000+00:00

INSERT INTO `MS_Ads_FS_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_FS_GeographicPerformanceDailyReport_be4d9b51_6ef5_42e0_b520_3afcaf77242f` AS main_table_alias)
