-- job_id: job_tloqECIIyzb8H9vrNKiHKbTwavG4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:10.808000+00:00
-- started: 2026-07-31T05:46:10.955000+00:00
-- ended: 2026-07-31T05:46:11.769000+00:00

INSERT INTO `MS_Ads_CL_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CL_GeographicPerformanceDailyReport_6c5d597c_0d65_472e_84d6_3292df01e1b9` AS main_table_alias)
