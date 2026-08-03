-- job_id: job_2-oFAYf3SQOjyxlqimnSxRWZHOnl
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:08.051000+00:00
-- started: 2026-07-31T05:46:08.195000+00:00
-- ended: 2026-07-31T05:46:08.966000+00:00

INSERT INTO `MS_Ads_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_PD_GeographicPerformanceDailyReport_a9512f04_99eb_4ca2_80a6_fae4c1ad4e26` AS main_table_alias)
