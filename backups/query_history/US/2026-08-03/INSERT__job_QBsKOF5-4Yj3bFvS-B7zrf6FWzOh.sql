-- job_id: job_QBsKOF5-4Yj3bFvS-B7zrf6FWzOh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:57.233000+00:00
-- started: 2026-08-03T05:45:57.531000+00:00
-- ended: 2026-08-03T05:45:58.348000+00:00

INSERT INTO `TikTok_CT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_Campaigns_1810d1e8_0a06_4f37_bf61_ec094a1e63a3` AS main_table_alias LEFT JOIN `TikTok_CT_Campaigns` ON main_table_alias.`Id` = `TikTok_CT_Campaigns`.`Id` WHERE `TikTok_CT_Campaigns`.`Id` IS NULL)
