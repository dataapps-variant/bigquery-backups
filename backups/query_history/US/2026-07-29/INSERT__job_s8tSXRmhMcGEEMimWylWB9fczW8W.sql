-- job_id: job_s8tSXRmhMcGEEMimWylWB9fczW8W
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:05.933000+00:00
-- started: 2026-07-29T05:46:06.152000+00:00
-- ended: 2026-07-29T05:46:06.968000+00:00

INSERT INTO `TikTok_JF_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Campaigns_4cbc1cb5_1d93_4d9b_80fc_d3d5f8733277` AS main_table_alias LEFT JOIN `TikTok_JF_Campaigns` ON main_table_alias.`Id` = `TikTok_JF_Campaigns`.`Id` WHERE `TikTok_JF_Campaigns`.`Id` IS NULL)
