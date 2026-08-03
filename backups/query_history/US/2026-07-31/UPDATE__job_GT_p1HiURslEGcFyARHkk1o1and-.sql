-- job_id: job_GT_p1HiURslEGcFyARHkk1o1and-
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T05:46:02.851000+00:00
-- started: 2026-07-31T05:46:03.185000+00:00
-- ended: 2026-07-31T05:46:04.202000+00:00

UPDATE `TikTok_DT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Campaigns_6c7c0c66_55f3_4e06_b319_059f87617bef` t2 WHERE t1.`Id` = t2.`Id`
