-- job_id: job_gZeUDkBHldt7jlGn3kRANWQZo0EL
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:01.432000+00:00
-- started: 2026-07-28T05:46:01.784000+00:00
-- ended: 2026-07-28T05:46:02.834000+00:00

DELETE FROM `MS_Ads_RT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
