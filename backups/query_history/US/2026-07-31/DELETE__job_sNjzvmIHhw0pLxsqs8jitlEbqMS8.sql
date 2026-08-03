-- job_id: job_sNjzvmIHhw0pLxsqs8jitlEbqMS8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:01.364000+00:00
-- started: 2026-07-31T05:46:01.689000+00:00
-- ended: 2026-07-31T05:46:02.741000+00:00

DELETE FROM `MS_Ads_AT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
