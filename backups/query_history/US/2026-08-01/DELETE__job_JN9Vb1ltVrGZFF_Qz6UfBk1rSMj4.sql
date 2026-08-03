-- job_id: job_JN9Vb1ltVrGZFF_Qz6UfBk1rSMj4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:07.990000+00:00
-- started: 2026-08-01T05:46:08.313000+00:00
-- ended: 2026-08-01T05:46:09.370000+00:00

DELETE FROM `MS_Ads_PD_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
