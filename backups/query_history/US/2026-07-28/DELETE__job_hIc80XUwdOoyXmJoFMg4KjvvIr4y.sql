-- job_id: job_hIc80XUwdOoyXmJoFMg4KjvvIr4y
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:01.450000+00:00
-- started: 2026-07-28T05:46:01.797000+00:00
-- ended: 2026-07-28T05:46:02.838000+00:00

DELETE FROM `MS_Ads_RT_AdPerformanceDailyReport` WHERE `Date` >= @p0
