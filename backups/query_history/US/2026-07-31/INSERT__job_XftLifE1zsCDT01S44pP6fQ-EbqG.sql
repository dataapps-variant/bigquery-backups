-- job_id: job_XftLifE1zsCDT01S44pP6fQ-EbqG
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:15.301000+00:00
-- started: 2026-07-31T05:46:15.812000+00:00
-- ended: 2026-07-31T05:46:16.636000+00:00

INSERT INTO `TikTok_JF_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdsDailyReport_ff44d069_9c2f_4b19_aa9b_6f95b57359b6` AS main_table_alias)
