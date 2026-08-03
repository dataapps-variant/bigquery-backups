-- job_id: job_31wk8Q_cz1hLL_ycjzrMUuL4UdkO
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:02.004000+00:00
-- started: 2026-07-30T05:46:02.264000+00:00
-- ended: 2026-07-30T05:46:03.173000+00:00

INSERT INTO `MS_Ads_IQ_GeographicPerformanceDailyReport` (`Date`, `AccountId`, `BaseCampaignId`, `CampaignId`, `CampaignName`, `Country`, `CurrencyCode`, `Clicks`, `Conversions`, `Spend`) (SELECT main_table_alias.`Date`,main_table_alias.`AccountId`,main_table_alias.`BaseCampaignId`,main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`Country`,main_table_alias.`CurrencyCode`,main_table_alias.`Clicks`,main_table_alias.`Conversions`,main_table_alias.`Spend`  FROM `MS_Ads_IQ_GeographicPerformanceDailyReport_35f62931_77ef_4c87_9cc2_0d154b7da1fe` AS main_table_alias)
