-- job_id: job_4tqtYI3RoaWIXhIYN-SQtD1hRImf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:01.379000+00:00
-- started: 2026-07-31T05:46:01.732000+00:00
-- ended: 2026-07-31T05:46:02.698000+00:00

DELETE FROM `MS_Ads_AT_AdPerformanceDailyReport` WHERE `Date` >= @p0
