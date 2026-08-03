-- job_id: job_BHUEfg_vN_58FBO0KI09E3GiTs-1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-01T05:45:59.335000+00:00
-- started: 2026-08-01T05:45:59.668000+00:00
-- ended: 2026-08-01T05:46:00.800000+00:00

UPDATE `TikTok_DT_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_AdGroups_d5729886_2e36_4516_a92d_a7f79f8e3c1c` t2 WHERE t1.`Id` = t2.`Id`
