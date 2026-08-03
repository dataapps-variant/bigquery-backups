-- job_id: job_Js3A04lk4DAhULe597GRdubxj-jL
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:01.547000+00:00
-- started: 2026-08-03T05:46:01.777000+00:00
-- ended: 2026-08-03T05:46:02.522000+00:00

INSERT INTO `MS_Ads_JF_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_JF_GeographicPerformanceDailyReport_4687dac1_3bc9_49cc_a38e_a8db940569ae` AS main_table_alias)
