-- job_id: job_nfX2JVrGPYHaNX_YFuRoZY_yTS7i
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-01T05:46:00.686000+00:00
-- started: 2026-08-01T05:46:01.048000+00:00
-- ended: 2026-08-01T05:46:02.053000+00:00

UPDATE `TikTok_CT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Campaigns_d8071097_1920_404c_9360_3528cf2a03b8` t2 WHERE t1.`Id` = t2.`Id`
