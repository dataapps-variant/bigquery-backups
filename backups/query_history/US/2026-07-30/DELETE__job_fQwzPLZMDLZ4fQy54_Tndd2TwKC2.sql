-- job_id: job_fQwzPLZMDLZ4fQy54_Tndd2TwKC2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:30.113000+00:00
-- started: 2026-07-30T05:46:30.571000+00:00
-- ended: 2026-07-30T05:46:31.814000+00:00

DELETE FROM `MS_Clicks_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
