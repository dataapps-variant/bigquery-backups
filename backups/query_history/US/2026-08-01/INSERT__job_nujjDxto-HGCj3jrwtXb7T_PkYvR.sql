-- job_id: job_nujjDxto-HGCj3jrwtXb7T_PkYvR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:17.616000+00:00
-- started: 2026-08-01T05:46:17.780000+00:00
-- ended: 2026-08-01T05:46:18.502000+00:00

INSERT INTO `MS_Clicks_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `AllConversions`, `AllCostPerConversion`, `Clicks`, `ConversionRate`, `Conversions`, `CostPerConversion`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`AllConversions`,main_table_alias.`AllCostPerConversion`,main_table_alias.`Clicks`,main_table_alias.`ConversionRate`,main_table_alias.`Conversions`,main_table_alias.`CostPerConversion`,main_table_alias.`Spend`  FROM `MS_Clicks_PD_GeographicPerformanceDailyReport_b4c6502f_6e0f_4f99_b4a3_b43f8aeef999` AS main_table_alias)
