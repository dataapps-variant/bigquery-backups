-- job_id: job_VjfBU2G98Aj04-v-5apJ0L5F3rTi
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:07.794000+00:00
-- started: 2026-08-03T05:46:07.993000+00:00
-- ended: 2026-08-03T05:46:08.760000+00:00

INSERT INTO `TikTok_JF_AdsDailyReport` (`CampaignId`, `CampaignName`, `AdGroupId`, `AdGroupName`, `AdId`, `AdName`, `Date`, `Spend`, `_skyvia_sync`) (SELECT main_table_alias.`CampaignId`,main_table_alias.`CampaignName`,main_table_alias.`AdGroupId`,main_table_alias.`AdGroupName`,main_table_alias.`AdId`,main_table_alias.`AdName`,main_table_alias.`Date`,main_table_alias.`Spend`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdsDailyReport_e6693050_03e8_4faa_85fd_e51573713f8a` AS main_table_alias)
