-- job_id: job_sqje5BZnm3G_KCKv3IQIZBdrwGaW
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T05:46:05.723000+00:00
-- started: 2026-07-31T05:46:06.070000+00:00
-- ended: 2026-07-31T05:46:07.185000+00:00

UPDATE `TikTok_JF_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_AdGroups_8a818a27_d575_45dd_9ec1_a61d9eda387a` t2 WHERE t1.`Id` = t2.`Id`
