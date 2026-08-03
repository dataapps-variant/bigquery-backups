-- job_id: job_BYNa8yzZc5lIkQoQ6-YDkTmH6LPX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:45:58.225000+00:00
-- started: 2026-08-02T05:45:58.560000+00:00
-- ended: 2026-08-02T05:45:59.605000+00:00

UPDATE `TikTok_DT_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_AdGroups_12dce4a8_34c5_481b_808a_98d9f2f94958` t2 WHERE t1.`Id` = t2.`Id`
