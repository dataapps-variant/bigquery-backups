-- job_id: job_24e6x7exYdNXAevJBYhsWMd1YLml
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:07.903000+00:00
-- started: 2026-07-28T05:46:08.063000+00:00
-- ended: 2026-07-28T05:46:08.894000+00:00

INSERT INTO `MS_Ads_CN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CN_GeographicPerformanceDailyReport_dc45ec44_3ed8_47d1_aa77_521bd5d6a314` AS main_table_alias)
