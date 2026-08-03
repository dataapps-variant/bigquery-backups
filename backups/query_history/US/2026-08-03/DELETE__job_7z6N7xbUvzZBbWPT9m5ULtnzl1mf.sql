-- job_id: job_7z6N7xbUvzZBbWPT9m5ULtnzl1mf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:00.217000+00:00
-- started: 2026-08-03T05:46:00.546000+00:00
-- ended: 2026-08-03T05:46:01.524000+00:00

DELETE FROM `MS_Ads_RT_AdPerformanceDailyReport` WHERE `Date` >= @p0
