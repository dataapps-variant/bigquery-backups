-- job_id: job_z7KXXJLx24X7tI03hDjehT7vW1Lx
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:04.775000+00:00
-- started: 2026-07-28T05:46:05.167000+00:00
-- ended: 2026-07-28T05:46:06.158000+00:00

DELETE FROM `MS_Ads_IQ_AdPerformanceDailyReport` WHERE `Date` >= @p0
