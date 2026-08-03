-- job_id: job_lS9GW0i_6-jDaEnAaPjsIo3BQEvU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:21.798000+00:00
-- started: 2026-08-01T05:46:22.125000+00:00
-- ended: 2026-08-01T05:46:23.981000+00:00

DELETE FROM `MS_Clicks_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
