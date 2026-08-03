-- job_id: job_dklV9IocTVfcv0AHcSDBoo7mjZdt
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:02.180000+00:00
-- started: 2026-08-01T05:46:02.355000+00:00
-- ended: 2026-08-01T05:46:03.405000+00:00

INSERT INTO `MS_Ads_IQ_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_GeographicPerformanceDailyReport_edff6431_9441_4b49_bcf7_167c1d3a3907` AS main_table_alias)
