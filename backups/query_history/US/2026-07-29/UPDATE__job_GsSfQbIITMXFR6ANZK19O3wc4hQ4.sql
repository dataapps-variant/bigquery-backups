-- job_id: job_GsSfQbIITMXFR6ANZK19O3wc4hQ4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T05:46:07.126000+00:00
-- started: 2026-07-29T05:46:07.500000+00:00
-- ended: 2026-07-29T05:46:08.524000+00:00

UPDATE `TikTok_DT_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_AdGroups_54addf04_66bf_41ab_a264_f99c76551788` t2 WHERE t1.`Id` = t2.`Id`
