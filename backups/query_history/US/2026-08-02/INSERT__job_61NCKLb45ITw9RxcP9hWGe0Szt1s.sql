-- job_id: job_61NCKLb45ITw9RxcP9hWGe0Szt1s
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:00.200000+00:00
-- started: 2026-08-02T05:46:00.370000+00:00
-- ended: 2026-08-02T05:46:01.235000+00:00

INSERT INTO `TikTok_CT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_Campaigns_c1f62cda_9526_4c5a_991d_c0afde6f5d1b` AS main_table_alias LEFT JOIN `TikTok_CT_Campaigns` ON main_table_alias.`Id` = `TikTok_CT_Campaigns`.`Id` WHERE `TikTok_CT_Campaigns`.`Id` IS NULL)
