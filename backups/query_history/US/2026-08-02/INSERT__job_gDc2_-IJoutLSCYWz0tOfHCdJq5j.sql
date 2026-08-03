-- job_id: job_gDc2_-IJoutLSCYWz0tOfHCdJq5j
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:59.886000+00:00
-- started: 2026-08-02T05:46:00.021000+00:00
-- ended: 2026-08-02T05:46:00.802000+00:00

INSERT INTO `TikTok_DT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_Campaigns_a48719f9_5f27_496f_9470_cdd18eb320fc` AS main_table_alias LEFT JOIN `TikTok_DT_Campaigns` ON main_table_alias.`Id` = `TikTok_DT_Campaigns`.`Id` WHERE `TikTok_DT_Campaigns`.`Id` IS NULL)
