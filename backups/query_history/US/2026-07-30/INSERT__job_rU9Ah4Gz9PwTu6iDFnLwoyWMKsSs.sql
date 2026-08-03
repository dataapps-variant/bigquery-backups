-- job_id: job_rU9Ah4Gz9PwTu6iDFnLwoyWMKsSs
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:00.551000+00:00
-- started: 2026-07-30T05:46:00.752000+00:00
-- ended: 2026-07-30T05:46:01.674000+00:00

INSERT INTO `TikTok_DT_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `AdAccountId`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`AdAccountId`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdGroups_78e6984b_3fe5_4601_8db1_5fe3d3260e56` AS main_table_alias LEFT JOIN `TikTok_DT_AdGroups` ON main_table_alias.`Id` = `TikTok_DT_AdGroups`.`Id` WHERE `TikTok_DT_AdGroups`.`Id` IS NULL)
