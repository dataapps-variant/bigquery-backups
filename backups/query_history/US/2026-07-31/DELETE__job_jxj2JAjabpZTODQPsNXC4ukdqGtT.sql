-- job_id: job_jxj2JAjabpZTODQPsNXC4ukdqGtT
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:23.872000+00:00
-- started: 2026-07-31T05:46:24.230000+00:00
-- ended: 2026-07-31T05:46:25.270000+00:00

DELETE FROM `MS_Clicks_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
