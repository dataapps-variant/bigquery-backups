-- job_id: job_5UuFXSeXTZoJCjHd0OE02ddu1cOv
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:58.429000+00:00
-- started: 2026-08-03T05:45:58.764000+00:00
-- ended: 2026-08-03T05:45:59.650000+00:00

DELETE FROM `MS_Ads_RT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
