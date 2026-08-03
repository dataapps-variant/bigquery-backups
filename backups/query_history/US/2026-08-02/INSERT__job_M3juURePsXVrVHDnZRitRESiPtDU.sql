-- job_id: job_M3juURePsXVrVHDnZRitRESiPtDU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:03.562000+00:00
-- started: 2026-08-02T05:46:03.784000+00:00
-- ended: 2026-08-02T05:46:04.576000+00:00

INSERT INTO `TikTok_JF_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Campaigns_84946b6b_7def_46ba_89be_8becdefe6fb3` AS main_table_alias LEFT JOIN `TikTok_JF_Campaigns` ON main_table_alias.`Id` = `TikTok_JF_Campaigns`.`Id` WHERE `TikTok_JF_Campaigns`.`Id` IS NULL)
