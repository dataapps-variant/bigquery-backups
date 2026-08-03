-- job_id: job_eIpcRCgYWx_ISw3Xki4weBUmYltB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-01T05:46:01.439000+00:00
-- started: 2026-08-01T05:46:01.802000+00:00
-- ended: 2026-08-01T05:46:02.983000+00:00

UPDATE `TikTok_JF_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Campaigns_f2d75613_6ba9_4d93_806d_11941e475a97` t2 WHERE t1.`Id` = t2.`Id`
