-- job_id: job_4nvlIHWMJOHyybzIEOB9MEDyDi84
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:45:58.563000+00:00
-- started: 2026-08-02T05:45:58.855000+00:00
-- ended: 2026-08-02T05:46:00.031000+00:00

UPDATE `TikTok_CT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_CT_Campaigns_c1f62cda_9526_4c5a_991d_c0afde6f5d1b` t2 WHERE t1.`Id` = t2.`Id`
