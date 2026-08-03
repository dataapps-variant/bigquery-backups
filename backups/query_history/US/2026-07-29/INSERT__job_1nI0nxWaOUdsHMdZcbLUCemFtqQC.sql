-- job_id: job_1nI0nxWaOUdsHMdZcbLUCemFtqQC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:08.953000+00:00
-- started: 2026-07-29T05:46:09.110000+00:00
-- ended: 2026-07-29T05:46:09.924000+00:00

INSERT INTO `MS_Ads_CT_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_CT_GeographicPerformanceDailyReport_fd0321de_0b09_4b6e_b53a_44f43a429e3f` AS main_table_alias)
