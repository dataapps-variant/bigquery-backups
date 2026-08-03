-- job_id: job_SWRl9hU8ZEVLKAbWsVwEZfc8j4XP
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:58.321000+00:00
-- started: 2026-08-02T05:45:58.529000+00:00
-- ended: 2026-08-02T05:45:59.285000+00:00

INSERT INTO `MS_Ads_AT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_AT_GeographicPerformanceDailyReport_70d7101c_b64b_4f09_bd50_7dda3960add5` AS main_table_alias)
