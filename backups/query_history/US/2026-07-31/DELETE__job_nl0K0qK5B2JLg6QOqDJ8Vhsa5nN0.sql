-- job_id: job_nl0K0qK5B2JLg6QOqDJ8Vhsa5nN0
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:01.499000+00:00
-- started: 2026-07-31T05:46:01.875000+00:00
-- ended: 2026-07-31T05:46:02.827000+00:00

DELETE FROM `MS_Ads_RT_AdPerformanceDailyReport` WHERE `Date` >= @p0
