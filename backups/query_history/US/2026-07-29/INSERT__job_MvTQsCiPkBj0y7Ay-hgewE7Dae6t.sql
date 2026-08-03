-- job_id: job_MvTQsCiPkBj0y7Ay-hgewE7Dae6t
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:09.906000+00:00
-- started: 2026-07-29T05:46:10.130000+00:00
-- ended: 2026-07-29T05:46:10.993000+00:00

INSERT INTO `MS_Ads_CL_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CL_GeographicPerformanceDailyReport_51944c1a_3ecd_4d66_bb9b_e281c0dc6c63` AS main_table_alias)
