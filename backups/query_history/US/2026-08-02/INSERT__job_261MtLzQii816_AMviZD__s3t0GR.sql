-- job_id: job_261MtLzQii816_AMviZD__s3t0GR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:59.531000+00:00
-- started: 2026-08-02T05:45:59.736000+00:00
-- ended: 2026-08-02T05:46:00.479000+00:00

INSERT INTO `MS_Ads_RT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_RT_GeographicPerformanceDailyReport_dfc43fdd_7446_4099_8d77_c1eecab044c4` AS main_table_alias)
