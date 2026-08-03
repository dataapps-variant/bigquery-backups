-- job_id: job_k1TQ-rNlj8Qc5wVMSxOxBO7T1hnc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:05.982000+00:00
-- started: 2026-07-29T05:46:06.189000+00:00
-- ended: 2026-07-29T05:46:06.948000+00:00

INSERT INTO `MS_Ads_JF_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_JF_GeographicPerformanceDailyReport_7b6837fd_c963_4ef6_982e_e4b8093b86c7` AS main_table_alias)
