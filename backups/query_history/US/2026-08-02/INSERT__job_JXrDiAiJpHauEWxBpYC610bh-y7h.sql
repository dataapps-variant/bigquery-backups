-- job_id: job_JXrDiAiJpHauEWxBpYC610bh-y7h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:59.677000+00:00
-- started: 2026-08-02T05:45:59.871000+00:00
-- ended: 2026-08-02T05:46:00.615000+00:00

INSERT INTO `MS_Ads_CN_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CN_GeographicPerformanceDailyReport_6e6e4a91_e21e_4938_ac8c_04052de266a9` AS main_table_alias)
