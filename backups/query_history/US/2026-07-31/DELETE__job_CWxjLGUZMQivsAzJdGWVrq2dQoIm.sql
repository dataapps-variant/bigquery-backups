-- job_id: job_CWxjLGUZMQivsAzJdGWVrq2dQoIm
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:05.027000+00:00
-- started: 2026-07-31T05:46:05.326000+00:00
-- ended: 2026-07-31T05:46:06.263000+00:00

DELETE FROM `MS_Ads_FS_AdPerformanceDailyReport` WHERE `Date` >= @p0
