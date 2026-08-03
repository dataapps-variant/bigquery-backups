-- job_id: job_KZWOYTBKwZgjmW9ytEQ4NvvIowm6
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:15.015000+00:00
-- started: 2026-07-28T05:46:15.165000+00:00
-- ended: 2026-07-28T05:46:15.956000+00:00

INSERT INTO `MS_Ads_CL_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CL_GeographicPerformanceDailyReport_ec858a90_8532_4823_90c4_5772ef5922ad` AS main_table_alias)
