-- job_id: job_YgtOnyetq-5wculMQkwmcCeDtPpz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:13.647000+00:00
-- started: 2026-07-28T05:46:13.961000+00:00
-- ended: 2026-07-28T05:46:15.304000+00:00

DELETE FROM `MS_Ads_CL_AdPerformanceDailyReport` WHERE `Date` >= @p0
