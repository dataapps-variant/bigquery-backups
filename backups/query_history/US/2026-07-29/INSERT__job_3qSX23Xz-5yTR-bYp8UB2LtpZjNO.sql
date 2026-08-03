-- job_id: job_3qSX23Xz-5yTR-bYp8UB2LtpZjNO
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:00.471000+00:00
-- started: 2026-07-29T05:46:00.677000+00:00
-- ended: 2026-07-29T05:46:01.473000+00:00

INSERT INTO `MS_Ads_RT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_RT_GeographicPerformanceDailyReport_cc08b84c_94f5_424a_a45e_362a75b3143b` AS main_table_alias)
