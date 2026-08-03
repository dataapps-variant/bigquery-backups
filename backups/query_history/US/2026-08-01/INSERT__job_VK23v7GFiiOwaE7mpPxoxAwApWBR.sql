-- job_id: job_VK23v7GFiiOwaE7mpPxoxAwApWBR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:06.322000+00:00
-- started: 2026-08-01T05:46:06.480000+00:00
-- ended: 2026-08-01T05:46:07.322000+00:00

INSERT INTO `TikTok_CT_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_AdsDailyReport_d299b97d_e78c_47c0_b6ed_0c4395b9ea4a` AS main_table_alias)
