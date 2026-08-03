-- job_id: job_0fXikXG75nuqzqjrPRgPVjFa7j65
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:03.949000+00:00
-- started: 2026-08-03T05:46:04.295000+00:00
-- ended: 2026-08-03T05:46:05.236000+00:00

DELETE FROM `MS_Ads_FS_AdPerformanceDailyReport` WHERE `Date` >= @p0
