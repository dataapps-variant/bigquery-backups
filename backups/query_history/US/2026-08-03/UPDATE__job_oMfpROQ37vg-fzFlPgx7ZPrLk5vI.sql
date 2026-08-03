-- job_id: job_oMfpROQ37vg-fzFlPgx7ZPrLk5vI
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T05:46:00.425000+00:00
-- started: 2026-08-03T05:46:00.880000+00:00
-- ended: 2026-08-03T05:46:02.003000+00:00

UPDATE `TikTok_JF_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_AdGroups_cbca7d1d_0581_4fac_af98_3e2a48486c1d` t2 WHERE t1.`Id` = t2.`Id`
