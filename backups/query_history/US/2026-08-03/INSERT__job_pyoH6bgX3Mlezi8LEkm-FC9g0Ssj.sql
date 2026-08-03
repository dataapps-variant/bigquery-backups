-- job_id: job_pyoH6bgX3Mlezi8LEkm-FC9g0Ssj
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:04.462000+00:00
-- started: 2026-08-03T05:46:04.623000+00:00
-- ended: 2026-08-03T05:46:05.560000+00:00

INSERT INTO `TikTok_DT_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `AdAccountId`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`AdAccountId`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdGroups_7d705b34_c96e_46de_9332_bbc58d5ee9af` AS main_table_alias LEFT JOIN `TikTok_DT_AdGroups` ON main_table_alias.`Id` = `TikTok_DT_AdGroups`.`Id` WHERE `TikTok_DT_AdGroups`.`Id` IS NULL)
