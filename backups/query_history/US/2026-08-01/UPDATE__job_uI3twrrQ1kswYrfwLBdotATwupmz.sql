-- job_id: job_uI3twrrQ1kswYrfwLBdotATwupmz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-01T05:46:08.139000+00:00
-- started: 2026-08-01T05:46:08.547000+00:00
-- ended: 2026-08-01T05:46:09.553000+00:00

UPDATE `TikTok_JF_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_AdGroups_0d9112a6_6a69_4df5_a287_be75bd1b640e` t2 WHERE t1.`Id` = t2.`Id`
