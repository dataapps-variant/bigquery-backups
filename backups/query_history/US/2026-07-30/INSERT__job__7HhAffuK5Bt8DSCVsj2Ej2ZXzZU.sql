-- job_id: job__7HhAffuK5Bt8DSCVsj2Ej2ZXzZU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:04.428000+00:00
-- started: 2026-07-30T05:46:04.600000+00:00
-- ended: 2026-07-30T05:46:05.434000+00:00

INSERT INTO `TikTok_DT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdsDailyReport_4dec0377_319f_4910_b418_11e2d55fd27e` AS main_table_alias)
