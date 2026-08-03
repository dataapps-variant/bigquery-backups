-- job_id: job_eWiwSIBTO04JTjfqkiUvGWMd2IXX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:58.108000+00:00
-- started: 2026-08-03T05:45:58.282000+00:00
-- ended: 2026-08-03T05:45:59.059000+00:00

INSERT INTO `MS_Ads_AT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_AT_GeographicPerformanceDailyReport_523921b0_1fa0_4ced_b46b_01aedbe2a2c3` AS main_table_alias)
