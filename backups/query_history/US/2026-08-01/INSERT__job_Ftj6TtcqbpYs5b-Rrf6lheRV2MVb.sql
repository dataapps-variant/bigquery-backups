-- job_id: job_Ftj6TtcqbpYs5b-Rrf6lheRV2MVb
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:00.994000+00:00
-- started: 2026-08-01T05:46:01.194000+00:00
-- ended: 2026-08-01T05:46:02.713000+00:00

INSERT INTO `TikTok_DT_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `AdAccountId`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`AdAccountId`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdGroups_d5729886_2e36_4516_a92d_a7f79f8e3c1c` AS main_table_alias LEFT JOIN `TikTok_DT_AdGroups` ON main_table_alias.`Id` = `TikTok_DT_AdGroups`.`Id` WHERE `TikTok_DT_AdGroups`.`Id` IS NULL)
