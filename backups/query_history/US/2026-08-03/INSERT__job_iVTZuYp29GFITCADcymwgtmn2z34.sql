-- job_id: job_iVTZuYp29GFITCADcymwgtmn2z34
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:01.590000+00:00
-- started: 2026-08-03T05:46:01.776000+00:00
-- ended: 2026-08-03T05:46:02.633000+00:00

INSERT INTO `TikTok_CT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_AdsDailyReport_ea7873c0_6cc3_4a73_bcf8_64298e817a43` AS main_table_alias)
