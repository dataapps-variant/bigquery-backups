-- job_id: job_qDMQKdicABLaWxU3oPRY1UqaVQD6
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:02.306000+00:00
-- started: 2026-07-31T05:46:02.617000+00:00
-- ended: 2026-07-31T05:46:03.573000+00:00

DELETE FROM `MS_Ads_IQ_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
