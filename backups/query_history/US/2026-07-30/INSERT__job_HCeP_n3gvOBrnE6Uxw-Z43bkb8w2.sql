-- job_id: job_HCeP_n3gvOBrnE6Uxw-Z43bkb8w2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:06.847000+00:00
-- started: 2026-07-30T05:46:07.051000+00:00
-- ended: 2026-07-30T05:46:08.015000+00:00

INSERT INTO `TikTok_JF_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Campaigns_a41aaf0c_6d67_4765_98f3_dbadc498d30c` AS main_table_alias LEFT JOIN `TikTok_JF_Campaigns` ON main_table_alias.`Id` = `TikTok_JF_Campaigns`.`Id` WHERE `TikTok_JF_Campaigns`.`Id` IS NULL)
