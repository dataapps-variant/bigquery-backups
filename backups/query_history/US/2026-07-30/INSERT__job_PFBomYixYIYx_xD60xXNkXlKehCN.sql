-- job_id: job_PFBomYixYIYx_xD60xXNkXlKehCN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:15.790000+00:00
-- started: 2026-07-30T05:46:15.971000+00:00
-- ended: 2026-07-30T05:46:17.054000+00:00

INSERT INTO `MS_Ads_EN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_EN_GeographicPerformanceDailyReport_761cae0d_140e_4295_94e3_d3e5682a5469` AS main_table_alias)
