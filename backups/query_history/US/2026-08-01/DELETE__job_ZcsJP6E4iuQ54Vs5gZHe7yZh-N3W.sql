-- job_id: job_ZcsJP6E4iuQ54Vs5gZHe7yZh-N3W
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:13.581000+00:00
-- started: 2026-08-01T05:46:13.894000+00:00
-- ended: 2026-08-01T05:46:14.849000+00:00

DELETE FROM `MS_Ads_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
