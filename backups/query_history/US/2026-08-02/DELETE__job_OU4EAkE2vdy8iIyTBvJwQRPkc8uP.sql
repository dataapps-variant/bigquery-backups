-- job_id: job_OU4EAkE2vdy8iIyTBvJwQRPkc8uP
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:01.433000+00:00
-- started: 2026-08-02T05:46:01.781000+00:00
-- ended: 2026-08-02T05:46:02.643000+00:00

DELETE FROM `MS_Ads_JF_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
