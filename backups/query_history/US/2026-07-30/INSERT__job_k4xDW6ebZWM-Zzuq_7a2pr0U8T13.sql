-- job_id: job_k4xDW6ebZWM-Zzuq_7a2pr0U8T13
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:00.714000+00:00
-- started: 2026-07-30T05:46:00.939000+00:00
-- ended: 2026-07-30T05:46:02.984000+00:00

INSERT INTO `TikTok_DT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_Campaigns_f683cbbd_e041_4256_b9dd_1e0e86cdd044` AS main_table_alias LEFT JOIN `TikTok_DT_Campaigns` ON main_table_alias.`Id` = `TikTok_DT_Campaigns`.`Id` WHERE `TikTok_DT_Campaigns`.`Id` IS NULL)
