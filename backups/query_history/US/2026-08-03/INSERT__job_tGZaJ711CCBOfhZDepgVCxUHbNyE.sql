-- job_id: job_tGZaJ711CCBOfhZDepgVCxUHbNyE
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:59.840000+00:00
-- started: 2026-08-03T05:45:59.961000+00:00
-- ended: 2026-08-03T05:46:00.808000+00:00

INSERT INTO `MS_Ads_RT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_RT_GeographicPerformanceDailyReport_0fd0f7c8_14ef_4f64_9848_eccf84333048` AS main_table_alias)
