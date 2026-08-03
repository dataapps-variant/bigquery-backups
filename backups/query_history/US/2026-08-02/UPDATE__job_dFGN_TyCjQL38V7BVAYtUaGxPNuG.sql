-- job_id: job_dFGN_TyCjQL38V7BVAYtUaGxPNuG
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:46:04.088000+00:00
-- started: 2026-08-02T05:46:04.378000+00:00
-- ended: 2026-08-02T05:46:05.360000+00:00

UPDATE `TikTok_JF_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_AdGroups_b5ef59a9_1dce_434f_9654_416118267f91` t2 WHERE t1.`Id` = t2.`Id`
