-- job_id: job_LhG-fBP5z5eXTPNaYGi4ukT61lyW
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:08.546000+00:00
-- started: 2026-08-01T05:46:08.748000+00:00
-- ended: 2026-08-01T05:46:09.550000+00:00

INSERT INTO `MS_Ads_CL_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CL_GeographicPerformanceDailyReport_e5cf2edb_8c53_4c4e_a277_a5d1a2c21f90` AS main_table_alias)
