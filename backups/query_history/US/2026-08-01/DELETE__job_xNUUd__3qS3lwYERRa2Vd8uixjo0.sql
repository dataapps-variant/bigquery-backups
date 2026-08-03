-- job_id: job_xNUUd__3qS3lwYERRa2Vd8uixjo0
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:00.539000+00:00
-- started: 2026-08-01T05:46:00.861000+00:00
-- ended: 2026-08-01T05:46:04.488000+00:00

DELETE FROM `MS_Ads_RT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
