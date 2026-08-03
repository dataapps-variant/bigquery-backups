-- job_id: job_MWdMjelFCL5EWaqGVddsAISs7qXh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:46:04.599000+00:00
-- started: 2026-07-30T05:46:05.096000+00:00
-- ended: 2026-07-30T05:46:06.178000+00:00

UPDATE `TikTok_JF_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_AdGroups_9229eb10_2c0d_4ce8_9fb7_fae398cc7787` t2 WHERE t1.`Id` = t2.`Id`
