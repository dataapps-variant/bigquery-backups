-- job_id: job_qgzLo4IUclKZTjnddvuvH-I3HIsl
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:57.182000+00:00
-- started: 2026-08-03T05:45:57.366000+00:00
-- ended: 2026-08-03T05:45:58.047000+00:00

INSERT INTO `TikTok_DT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdsDailyReport_7b70342a_843f_4a20_8763_2361416a9c0b` AS main_table_alias)
