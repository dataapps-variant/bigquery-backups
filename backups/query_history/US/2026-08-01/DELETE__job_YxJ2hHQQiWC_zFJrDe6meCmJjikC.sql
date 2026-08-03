-- job_id: job_YxJ2hHQQiWC_zFJrDe6meCmJjikC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:45:59.962000+00:00
-- started: 2026-08-01T05:46:00.339000+00:00
-- ended: 2026-08-01T05:46:01.248000+00:00

DELETE FROM `MS_Ads_CN_AdPerformanceDailyReport` WHERE `Date` >= @p0
