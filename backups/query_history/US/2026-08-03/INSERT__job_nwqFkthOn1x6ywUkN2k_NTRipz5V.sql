-- job_id: job_nwqFkthOn1x6ywUkN2k_NTRipz5V
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:01.916000+00:00
-- started: 2026-08-03T05:46:02.076000+00:00
-- ended: 2026-08-03T05:46:03.538000+00:00

INSERT INTO `MS_Ads_PD_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_PD_GeographicPerformanceDailyReport_96e82c40_1df1_4758_8e7a_6b010b56c8ac` AS main_table_alias)
