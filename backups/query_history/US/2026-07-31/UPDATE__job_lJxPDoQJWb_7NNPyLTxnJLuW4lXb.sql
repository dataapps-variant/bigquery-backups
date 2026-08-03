-- job_id: job_lJxPDoQJWb_7NNPyLTxnJLuW4lXb
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T05:46:00.892000+00:00
-- started: 2026-07-31T05:46:01.178000+00:00
-- ended: 2026-07-31T05:46:02.162000+00:00

UPDATE `TikTok_CT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Campaigns_ea4d3062_4432_4687_91e1_b5f2c922b2b3` t2 WHERE t1.`Id` = t2.`Id`
