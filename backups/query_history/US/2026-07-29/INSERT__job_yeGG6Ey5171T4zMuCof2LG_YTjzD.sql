-- job_id: job_yeGG6Ey5171T4zMuCof2LG_YTjzD
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:09.934000+00:00
-- started: 2026-07-29T05:46:10.184000+00:00
-- ended: 2026-07-29T05:46:11.233000+00:00

INSERT INTO `TikTok_CT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_AdsDailyReport_d5c66aaa_02f4_45d0_990a_1cc8dfa7dbd3` AS main_table_alias)
