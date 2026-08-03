-- job_id: job_KkVnH9O_uzdvOWFnblH9ets4wQyI
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:04.909000+00:00
-- started: 2026-07-31T05:46:05.969000+00:00
-- ended: 2026-07-31T05:46:07.630000+00:00

INSERT INTO `TikTok_JF_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Campaigns_ff66f90f_29ac_4c47_b4e3_85094f6cfe38` AS main_table_alias LEFT JOIN `TikTok_JF_Campaigns` ON main_table_alias.`Id` = `TikTok_JF_Campaigns`.`Id` WHERE `TikTok_JF_Campaigns`.`Id` IS NULL)
