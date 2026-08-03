-- job_id: job_8YsJ5CV9JdEfO3eKVDM9RMMbrz2Y
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:03.764000+00:00
-- started: 2026-07-31T05:46:03.931000+00:00
-- ended: 2026-07-31T05:46:04.696000+00:00

INSERT INTO `MS_Ads_IQ_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_GeographicPerformanceDailyReport_99a80fb9_6f9f_4bff_9bf6_ca2ac9490baf` AS main_table_alias)
