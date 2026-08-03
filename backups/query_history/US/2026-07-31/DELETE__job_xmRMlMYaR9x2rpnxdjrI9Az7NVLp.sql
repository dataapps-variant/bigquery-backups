-- job_id: job_xmRMlMYaR9x2rpnxdjrI9Az7NVLp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:01.497000+00:00
-- started: 2026-07-31T05:46:01.840000+00:00
-- ended: 2026-07-31T05:46:02.646000+00:00

DELETE FROM `MS_Ads_RT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
