-- job_id: job_5oPKCKFZHeZao1v7hZO2N-223S8u
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:09.669000+00:00
-- started: 2026-08-01T05:46:09.848000+00:00
-- ended: 2026-08-01T05:46:10.643000+00:00

INSERT INTO `MS_Ads_CT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CT_GeographicPerformanceDailyReport_0b7533b8_e914_4db3_bd35_a8cdc60704b9` AS main_table_alias)
