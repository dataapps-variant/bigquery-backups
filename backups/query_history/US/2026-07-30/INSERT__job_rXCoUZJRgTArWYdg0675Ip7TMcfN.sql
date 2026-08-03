-- job_id: job_rXCoUZJRgTArWYdg0675Ip7TMcfN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:14.918000+00:00
-- started: 2026-07-30T05:46:15.087000+00:00
-- ended: 2026-07-30T05:46:16.097000+00:00

INSERT INTO `MS_Ads_CL_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CL_GeographicPerformanceDailyReport_79affa12_6618_468b_8314_e29e427cea66` AS main_table_alias)
