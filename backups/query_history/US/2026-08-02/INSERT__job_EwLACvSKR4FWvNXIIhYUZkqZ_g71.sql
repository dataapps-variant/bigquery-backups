-- job_id: job_EwLACvSKR4FWvNXIIhYUZkqZ_g71
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:05.466000+00:00
-- started: 2026-08-02T05:46:05.622000+00:00
-- ended: 2026-08-02T05:46:06.400000+00:00

INSERT INTO `MS_Ads_CT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CT_GeographicPerformanceDailyReport_c24e9510_de54_4318_9751_6f81d63341cb` AS main_table_alias)
