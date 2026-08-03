-- job_id: job_BcAuS30ClbcsrrrIv6hqIZzalXJ5
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:13.916000+00:00
-- started: 2026-07-28T05:46:14.108000+00:00
-- ended: 2026-07-28T05:46:14.957000+00:00

INSERT INTO `TikTok_CT_Campaigns` (`Id`, `Name`, `Type`, `AdAccountId`, `CreatedDate`, `UpdatedDate`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`Name`,main_table_alias.`Type`,main_table_alias.`AdAccountId`,main_table_alias.`CreatedDate`,main_table_alias.`UpdatedDate`,main_table_alias.`_skyvia_sync`  FROM `TikTok_CT_Campaigns_1bd971af_5c6b_42f7_a4d8_a96e5285745a` AS main_table_alias LEFT JOIN `TikTok_CT_Campaigns` ON main_table_alias.`Id` = `TikTok_CT_Campaigns`.`Id` WHERE `TikTok_CT_Campaigns`.`Id` IS NULL)
