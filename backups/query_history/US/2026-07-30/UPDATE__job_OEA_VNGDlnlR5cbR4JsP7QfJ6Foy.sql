-- job_id: job_OEA_VNGDlnlR5cbR4JsP7QfJ6Foy
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T05:46:05.120000+00:00
-- started: 2026-07-30T05:46:05.454000+00:00
-- ended: 2026-07-30T05:46:06.681000+00:00

UPDATE `TikTok_JF_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Campaigns_a41aaf0c_6d67_4765_98f3_dbadc498d30c` t2 WHERE t1.`Id` = t2.`Id`
