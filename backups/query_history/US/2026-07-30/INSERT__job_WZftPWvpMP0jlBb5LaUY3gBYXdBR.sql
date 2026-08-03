-- job_id: job_WZftPWvpMP0jlBb5LaUY3gBYXdBR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:09.987000+00:00
-- started: 2026-07-30T05:46:10.165000+00:00
-- ended: 2026-07-30T05:46:11.009000+00:00

INSERT INTO `MS_Ads_JF_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_JF_GeographicPerformanceDailyReport_1a42b15d_cba0_4127_bf6e_96d3cc16abc3` AS main_table_alias)
