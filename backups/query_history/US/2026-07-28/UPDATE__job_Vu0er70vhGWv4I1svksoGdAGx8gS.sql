-- job_id: job_Vu0er70vhGWv4I1svksoGdAGx8gS
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T05:46:10.481000+00:00
-- started: 2026-07-28T05:46:10.815000+00:00
-- ended: 2026-07-28T05:46:12.010000+00:00

UPDATE `TikTok_JF_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_JF_Campaigns_e8d05822_b2bd_4774_be08_6b3c51b68170` t2 WHERE t1.`Id` = t2.`Id`
