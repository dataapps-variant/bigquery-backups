-- job_id: job_4noYESZtYAv_qU4lDz5UaAG3KStC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T05:46:02.817000+00:00
-- started: 2026-07-31T05:46:03.186000+00:00
-- ended: 2026-07-31T05:46:04.233000+00:00

UPDATE `TikTok_DT_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_AdGroups_957c6078_86e7_4c37_8e2a_56c51c80ba6f` t2 WHERE t1.`Id` = t2.`Id`
