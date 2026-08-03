-- job_id: job_jBQ-nJl2QdcN5sPXN9xN6kmvHqlO
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:04.240000+00:00
-- started: 2026-07-31T05:46:04.388000+00:00
-- ended: 2026-07-31T05:46:05.169000+00:00

INSERT INTO `TikTok_DT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdsDailyReport_4f723def_ea7c_447f_a301_83ac04e37502` AS main_table_alias)
