-- job_id: job_kOiPuSshjA7Q0_IywnqpZ3jiFNRx
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:45:57.385000+00:00
-- started: 2026-08-03T05:45:57.583000+00:00
-- ended: 2026-08-03T05:45:58.680000+00:00

INSERT INTO `TikTok_DT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_Campaigns_1e207907_0aad_4ee0_bd3b_4747d760e27c` AS main_table_alias LEFT JOIN `TikTok_DT_Campaigns` ON main_table_alias.`Id` = `TikTok_DT_Campaigns`.`Id` WHERE `TikTok_DT_Campaigns`.`Id` IS NULL)
