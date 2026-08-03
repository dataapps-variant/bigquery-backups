-- job_id: job_A5bhUfp4R6ZpvgcXI6LGKK24w30w
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:17.060000+00:00
-- started: 2026-07-28T05:46:17.209000+00:00
-- ended: 2026-07-28T05:46:18.595000+00:00

INSERT INTO `TikTok_CT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_AdsDailyReport_f3952cee_bff9_4d8f_bb90_e41f35a621f3` AS main_table_alias)
