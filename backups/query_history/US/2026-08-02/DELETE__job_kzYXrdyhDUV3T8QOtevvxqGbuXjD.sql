-- job_id: job_kzYXrdyhDUV3T8QOtevvxqGbuXjD
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:19.362000+00:00
-- started: 2026-08-02T05:46:19.626000+00:00
-- ended: 2026-08-02T05:46:20.691000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
