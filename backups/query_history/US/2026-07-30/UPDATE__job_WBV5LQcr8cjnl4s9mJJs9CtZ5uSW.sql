-- job_id: job_WBV5LQcr8cjnl4s9mJJs9CtZ5uSW
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:45:58.840000+00:00
-- started: 2026-07-30T05:45:59.236000+00:00
-- ended: 2026-07-30T05:46:00.322000+00:00

UPDATE `TikTok_DT_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_AdGroups_78e6984b_3fe5_4601_8db1_5fe3d3260e56` t2 WHERE t1.`Id` = t2.`Id`
