-- job_id: job_trBdht-jyOJMX0OKdizOoyqib8tT
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:45:59.787000+00:00
-- started: 2026-08-02T05:45:59.981000+00:00
-- ended: 2026-08-02T05:46:00.842000+00:00

INSERT INTO `TikTok_DT_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `AdAccountId`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`AdAccountId`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_DT_AdGroups_12dce4a8_34c5_481b_808a_98d9f2f94958` AS main_table_alias LEFT JOIN `TikTok_DT_AdGroups` ON main_table_alias.`Id` = `TikTok_DT_AdGroups`.`Id` WHERE `TikTok_DT_AdGroups`.`Id` IS NULL)
