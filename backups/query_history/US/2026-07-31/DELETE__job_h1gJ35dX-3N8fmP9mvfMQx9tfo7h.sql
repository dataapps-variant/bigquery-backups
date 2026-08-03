-- job_id: job_h1gJ35dX-3N8fmP9mvfMQx9tfo7h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:00.531000+00:00
-- started: 2026-07-31T05:46:00.883000+00:00
-- ended: 2026-07-31T05:46:01.814000+00:00

DELETE FROM `MS_Ads_CN_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
