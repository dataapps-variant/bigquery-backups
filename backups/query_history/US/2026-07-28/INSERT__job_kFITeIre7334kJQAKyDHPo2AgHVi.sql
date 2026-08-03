-- job_id: job_kFITeIre7334kJQAKyDHPo2AgHVi
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:18.616000+00:00
-- started: 2026-07-28T05:46:18.784000+00:00
-- ended: 2026-07-28T05:46:19.584000+00:00

INSERT INTO `TikTok_DT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdsDailyReport_f86bf2b5_e691_4c43_90c8_18fcff4cda69` AS main_table_alias)
