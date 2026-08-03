-- job_id: job_E6RwxfeVjpHqp7Y3jNm4uOwLg9fh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:45:59.933000+00:00
-- started: 2026-08-01T05:46:00.333000+00:00
-- ended: 2026-08-01T05:46:01.925000+00:00

DELETE FROM `MS_Ads_CN_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
