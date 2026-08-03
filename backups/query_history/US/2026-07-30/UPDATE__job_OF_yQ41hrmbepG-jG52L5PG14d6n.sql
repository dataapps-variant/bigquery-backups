-- job_id: job_OF_yQ41hrmbepG-jG52L5PG14d6n
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:46:01.065000+00:00
-- started: 2026-07-30T05:46:01.445000+00:00
-- ended: 2026-07-30T05:46:02.587000+00:00

UPDATE `TikTok_CT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Campaigns_2e7206ee_db6a_4ead_87be_216d37b2c669` t2 WHERE t1.`Id` = t2.`Id`
