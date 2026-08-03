-- job_id: job_HUgw-KYfs6R7UP1SzmKFRBaI0PJs
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:04.206000+00:00
-- started: 2026-08-03T05:46:04.354000+00:00
-- ended: 2026-08-03T05:46:05.163000+00:00

INSERT INTO `MS_Ads_CT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CT_GeographicPerformanceDailyReport_3ee4b74f_628d_4f19_a954_b403b0f7be22` AS main_table_alias)
