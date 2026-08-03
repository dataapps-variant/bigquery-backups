-- job_id: job_eC_wM00-Q1Q_117zAHhLeqg5c9Ah
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:06.403000+00:00
-- started: 2026-07-30T05:46:06.674000+00:00
-- ended: 2026-07-30T05:46:07.545000+00:00

INSERT INTO `TikTok_JF_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdGroups_9229eb10_2c0d_4ce8_9fb7_fae398cc7787` AS main_table_alias LEFT JOIN `TikTok_JF_AdGroups` ON main_table_alias.`Id` = `TikTok_JF_AdGroups`.`Id` WHERE `TikTok_JF_AdGroups`.`Id` IS NULL)
