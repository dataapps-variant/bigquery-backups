-- job_id: job_5rwjSDAIcibgXkiQOpmRuQyJrHjm
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:14.049000+00:00
-- started: 2026-07-28T05:46:14.231000+00:00
-- ended: 2026-07-28T05:46:15.051000+00:00

INSERT INTO `TikTok_JF_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdGroups_d1fa5aa6_f88b_4be4_9249_2e3c88952486` AS main_table_alias LEFT JOIN `TikTok_JF_AdGroups` ON main_table_alias.`Id` = `TikTok_JF_AdGroups`.`Id` WHERE `TikTok_JF_AdGroups`.`Id` IS NULL)
