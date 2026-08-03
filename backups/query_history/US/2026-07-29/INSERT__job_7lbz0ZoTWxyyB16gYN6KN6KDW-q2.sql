-- job_id: job_7lbz0ZoTWxyyB16gYN6KN6KDW-q2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:20.398000+00:00
-- started: 2026-07-29T05:46:20.559000+00:00
-- ended: 2026-07-29T05:46:21.423000+00:00

INSERT INTO `MS_Clicks_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `AllConversions`, `AllCostPerConversion`, `Clicks`, `ConversionRate`, `Conversions`, `CostPerConversion`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`AllConversions`,main_table_alias.`AllCostPerConversion`,main_table_alias.`Clicks`,main_table_alias.`ConversionRate`,main_table_alias.`Conversions`,main_table_alias.`CostPerConversion`,main_table_alias.`Spend`  FROM `MS_Clicks_PD_GeographicPerformanceDailyReport_fae07c48_7120_4234_8ebb_1baabfa8d444` AS main_table_alias)
