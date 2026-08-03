-- job_id: job_7a00W7pivYalHwp56Jlw3xoINr5L
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:08.666000+00:00
-- started: 2026-07-29T05:46:08.821000+00:00
-- ended: 2026-07-29T05:46:09.674000+00:00

INSERT INTO `TikTok_DT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_Campaigns_f65d002a_c194_41fb_a4f6_2c94f66e34ef` AS main_table_alias LEFT JOIN `TikTok_DT_Campaigns` ON main_table_alias.`Id` = `TikTok_DT_Campaigns`.`Id` WHERE `TikTok_DT_Campaigns`.`Id` IS NULL)
