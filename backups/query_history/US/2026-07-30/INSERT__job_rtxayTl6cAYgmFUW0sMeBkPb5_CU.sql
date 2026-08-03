-- job_id: job_rtxayTl6cAYgmFUW0sMeBkPb5_CU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:02.822000+00:00
-- started: 2026-07-30T05:46:03.255000+00:00
-- ended: 2026-07-30T05:46:04.443000+00:00

INSERT INTO `TikTok_CT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_Campaigns_2e7206ee_db6a_4ead_87be_216d37b2c669` AS main_table_alias LEFT JOIN `TikTok_CT_Campaigns` ON main_table_alias.`Id` = `TikTok_CT_Campaigns`.`Id` WHERE `TikTok_CT_Campaigns`.`Id` IS NULL)
