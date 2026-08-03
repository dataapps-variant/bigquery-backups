-- job_id: job_PqqkYzEqiLatP9I8RJ6tW3kLLJSc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:02.602000+00:00
-- started: 2026-08-03T05:46:02.934000+00:00
-- ended: 2026-08-03T05:46:03.915000+00:00

DELETE FROM `MS_Ads_FS_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
