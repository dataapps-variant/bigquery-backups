-- job_id: job_SX8fo-zt3QGAaXc1HteT3q9Yd7se
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:00.564000+00:00
-- started: 2026-08-01T05:46:00.909000+00:00
-- ended: 2026-08-01T05:46:02.010000+00:00

DELETE FROM `MS_Ads_RT_AdPerformanceDailyReport` WHERE `Date` >= @p0
