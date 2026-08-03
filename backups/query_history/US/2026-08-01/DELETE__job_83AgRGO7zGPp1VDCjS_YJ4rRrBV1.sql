-- job_id: job_83AgRGO7zGPp1VDCjS_YJ4rRrBV1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:13.361000+00:00
-- started: 2026-08-01T05:46:13.659000+00:00
-- ended: 2026-08-01T05:46:14.596000+00:00

DELETE FROM `MS_Ads_FS_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
