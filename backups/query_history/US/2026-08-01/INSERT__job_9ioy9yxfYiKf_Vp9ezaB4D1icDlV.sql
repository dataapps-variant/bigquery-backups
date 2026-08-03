-- job_id: job_9ioy9yxfYiKf_Vp9ezaB4D1icDlV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:09.764000+00:00
-- started: 2026-08-01T05:46:10.010000+00:00
-- ended: 2026-08-01T05:46:10.881000+00:00

INSERT INTO `TikTok_JF_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdGroups_0d9112a6_6a69_4df5_a287_be75bd1b640e` AS main_table_alias LEFT JOIN `TikTok_JF_AdGroups` ON main_table_alias.`Id` = `TikTok_JF_AdGroups`.`Id` WHERE `TikTok_JF_AdGroups`.`Id` IS NULL)
