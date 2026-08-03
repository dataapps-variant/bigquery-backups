-- job_id: job_GpqnCabC4Pt25gaAj2rLl3-jgfrs
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:14.172000+00:00
-- started: 2026-07-28T05:46:14.502000+00:00
-- ended: 2026-07-28T05:46:15.567000+00:00

UPDATE `TikTok_DT_AdGroups` t1 SET t1.`CampaignId` = t2.`CampaignId`, t1.`Name` = t2.`Name`, t1.`PlacementType` = t2.`PlacementType`, t1.`LocationIds` = t2.`LocationIds`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`Actions` = t2.`Actions`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_AdGroups_53b1e08f_cf48_4c5d_a4ad_037982a199ba` t2 WHERE t1.`Id` = t2.`Id`
