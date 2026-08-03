-- job_id: job_SYi6u9p-a5E8KFEkvunHAF9QSdIY
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:02.715000+00:00
-- started: 2026-08-03T05:46:03.045000+00:00
-- ended: 2026-08-03T05:46:04.015000+00:00

DELETE FROM `MS_Ads_CL_AdPerformanceDailyReport` WHERE `Date` >= @p0
