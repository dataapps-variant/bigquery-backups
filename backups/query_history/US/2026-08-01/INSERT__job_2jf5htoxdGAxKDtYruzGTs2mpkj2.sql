-- job_id: job_2jf5htoxdGAxKDtYruzGTs2mpkj2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:02.295000+00:00
-- started: 2026-08-01T05:46:02.469000+00:00
-- ended: 2026-08-01T05:46:03.313000+00:00

INSERT INTO `TikTok_CT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_Campaigns_d8071097_1920_404c_9360_3528cf2a03b8` AS main_table_alias LEFT JOIN `TikTok_CT_Campaigns` ON main_table_alias.`Id` = `TikTok_CT_Campaigns`.`Id` WHERE `TikTok_CT_Campaigns`.`Id` IS NULL)
