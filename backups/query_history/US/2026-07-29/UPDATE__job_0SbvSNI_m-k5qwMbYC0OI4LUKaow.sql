-- job_id: job_0SbvSNI_m-k5qwMbYC0OI4LUKaow
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T05:46:05.191000+00:00
-- started: 2026-07-29T05:46:05.509000+00:00
-- ended: 2026-07-29T05:46:06.602000+00:00

UPDATE `TikTok_JF_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_AdGroups_41ce8964_03f3_48da_bb8c_1fc9164e9e4b` t2 WHERE t1.`Id` = t2.`Id`
