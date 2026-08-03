-- job_id: job_IgREjoH4xCNOsrjZZRj9SVFP7DTl
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:58.477000+00:00
-- started: 2026-08-03T05:45:58.640000+00:00
-- ended: 2026-08-03T05:45:59.462000+00:00

INSERT INTO `TikTok_JF_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_Campaigns_af1d8a8d_34ee_461d_a630_c238f7211f44` AS main_table_alias LEFT JOIN `TikTok_JF_Campaigns` ON main_table_alias.`Id` = `TikTok_JF_Campaigns`.`Id` WHERE `TikTok_JF_Campaigns`.`Id` IS NULL)
