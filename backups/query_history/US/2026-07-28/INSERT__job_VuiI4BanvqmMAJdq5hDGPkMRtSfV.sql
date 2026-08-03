-- job_id: job_VuiI4BanvqmMAJdq5hDGPkMRtSfV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:15.537000+00:00
-- started: 2026-07-28T05:46:15.716000+00:00
-- ended: 2026-07-28T05:46:16.733000+00:00

INSERT INTO `TikTok_DT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_Campaigns_3448bfd2_5b32_4aea_bc9e_17490528d413` AS main_table_alias LEFT JOIN `TikTok_DT_Campaigns` ON main_table_alias.`Id` = `TikTok_DT_Campaigns`.`Id` WHERE `TikTok_DT_Campaigns`.`Id` IS NULL)
