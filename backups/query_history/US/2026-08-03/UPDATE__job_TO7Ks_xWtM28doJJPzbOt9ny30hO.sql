-- job_id: job_TO7Ks_xWtM28doJJPzbOt9ny30hO
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T05:46:02.898000+00:00
-- started: 2026-08-03T05:46:03.192000+00:00
-- ended: 2026-08-03T05:46:04.289000+00:00

UPDATE `TikTok_DT_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_AdGroups_7d705b34_c96e_46de_9332_bbc58d5ee9af` t2 WHERE t1.`Id` = t2.`Id`
