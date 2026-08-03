-- job_id: job_uO3yHe2mvD_2Rwl1YDP7AXMwnnwp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:12.594000+00:00
-- started: 2026-08-01T05:46:12.736000+00:00
-- ended: 2026-08-01T05:46:13.681000+00:00

INSERT INTO `TikTok_JF_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdsDailyReport_694942a2_0db6_46c0_8612_bce5086fdd50` AS main_table_alias)
