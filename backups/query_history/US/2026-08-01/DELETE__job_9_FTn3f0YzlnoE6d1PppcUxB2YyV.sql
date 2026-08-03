-- job_id: job_9_FTn3f0YzlnoE6d1PppcUxB2YyV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:12.494000+00:00
-- started: 2026-08-01T05:46:12.819000+00:00
-- ended: 2026-08-01T05:46:13.719000+00:00

DELETE FROM `MS_Ads_FS_AdPerformanceDailyReport` WHERE `Date` >= @p0
