-- job_id: job_QTXd4P-yQOHKF3GvEHd0YM1W7Kcw
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:07.362000+00:00
-- started: 2026-07-31T05:46:07.486000+00:00
-- ended: 2026-07-31T05:46:09.765000+00:00

INSERT INTO `TikTok_JF_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdGroups_8a818a27_d575_45dd_9ec1_a61d9eda387a` AS main_table_alias LEFT JOIN `TikTok_JF_AdGroups` ON main_table_alias.`Id` = `TikTok_JF_AdGroups`.`Id` WHERE `TikTok_JF_AdGroups`.`Id` IS NULL)
