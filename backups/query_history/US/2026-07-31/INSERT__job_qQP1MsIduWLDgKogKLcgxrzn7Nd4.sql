-- job_id: job_qQP1MsIduWLDgKogKLcgxrzn7Nd4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:17.921000+00:00
-- started: 2026-07-31T05:46:18.054000+00:00
-- ended: 2026-07-31T05:46:18.948000+00:00

INSERT INTO `MS_Clicks_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `AllConversions`, `AllCostPerConversion`, `Clicks`, `ConversionRate`, `Conversions`, `CostPerConversion`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`AllConversions`,main_table_alias.`AllCostPerConversion`,main_table_alias.`Clicks`,main_table_alias.`ConversionRate`,main_table_alias.`Conversions`,main_table_alias.`CostPerConversion`,main_table_alias.`Spend`  FROM `MS_Clicks_PD_GeographicPerformanceDailyReport_93fc3955_555c_4f6e_9214_5e7a0bb158c7` AS main_table_alias)
