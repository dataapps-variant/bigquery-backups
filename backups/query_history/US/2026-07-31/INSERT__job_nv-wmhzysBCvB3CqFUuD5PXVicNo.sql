-- job_id: job_nv-wmhzysBCvB3CqFUuD5PXVicNo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:04.427000+00:00
-- started: 2026-07-31T05:46:04.673000+00:00
-- ended: 2026-07-31T05:46:05.483000+00:00

INSERT INTO `TikTok_DT_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `AdAccountId`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`AdAccountId`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdGroups_957c6078_86e7_4c37_8e2a_56c51c80ba6f` AS main_table_alias LEFT JOIN `TikTok_DT_AdGroups` ON main_table_alias.`Id` = `TikTok_DT_AdGroups`.`Id` WHERE `TikTok_DT_AdGroups`.`Id` IS NULL)
