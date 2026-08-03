-- job_id: job_JjNhicg6UY7LmYq0zU2WWi-WIH9N
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:12.534000+00:00
-- started: 2026-07-28T05:46:12.888000+00:00
-- ended: 2026-07-28T05:46:13.880000+00:00

UPDATE `TikTok_JF_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_AdGroups_d1fa5aa6_f88b_4be4_9249_2e3c88952486` t2 WHERE t1.`Id` = t2.`Id`
