-- job_id: job_PSpgC3DNU2zFvRNSqRDL0sTBaNM9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T05:46:04.351000+00:00
-- started: 2026-07-29T05:46:04.713000+00:00
-- ended: 2026-07-29T05:46:05.752000+00:00

UPDATE `TikTok_JF_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Campaigns_4cbc1cb5_1d93_4d9b_80fc_d3d5f8733277` t2 WHERE t1.`Id` = t2.`Id`
