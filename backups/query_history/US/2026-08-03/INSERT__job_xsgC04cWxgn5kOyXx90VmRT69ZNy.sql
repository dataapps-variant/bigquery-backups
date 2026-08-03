-- job_id: job_xsgC04cWxgn5kOyXx90VmRT69ZNy
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:02.208000+00:00
-- started: 2026-08-03T05:46:02.357000+00:00
-- ended: 2026-08-03T05:46:03.340000+00:00

INSERT INTO `TikTok_JF_AdGroups` (`Id`, `CampaignId`, `Name`, `PlacementType`, `LocationIds`, `Actions`, `_skyvia_sync`) (SELECT main_table_alias.`Id`,main_table_alias.`CampaignId`,main_table_alias.`Name`,main_table_alias.`PlacementType`,main_table_alias.`LocationIds`,main_table_alias.`Actions`,main_table_alias.`_skyvia_sync`  FROM `TikTok_JF_AdGroups_cbca7d1d_0581_4fac_af98_3e2a48486c1d` AS main_table_alias LEFT JOIN `TikTok_JF_AdGroups` ON main_table_alias.`Id` = `TikTok_JF_AdGroups`.`Id` WHERE `TikTok_JF_AdGroups`.`Id` IS NULL)
