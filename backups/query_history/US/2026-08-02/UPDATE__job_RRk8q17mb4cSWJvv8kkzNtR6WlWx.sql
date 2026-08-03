-- job_id: job_RRk8q17mb4cSWJvv8kkzNtR6WlWx
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T05:45:58.314000+00:00
-- started: 2026-08-02T05:45:58.643000+00:00
-- ended: 2026-08-02T05:45:59.680000+00:00

UPDATE `TikTok_DT_Campaigns` t1 SET t1.`Name` = t2.`Name`, t1.`Type` = t2.`Type`, t1.`AdAccountId` = t2.`AdAccountId`, t1.`CreatedDate` = t2.`CreatedDate`, t1.`UpdatedDate` = t2.`UpdatedDate`, t1.`_skyvia_sync` = t2.`_skyvia_sync` FROM `TikTok_DT_Campaigns_a48719f9_5f27_496f_9470_cdd18eb320fc` t2 WHERE t1.`Id` = t2.`Id`
