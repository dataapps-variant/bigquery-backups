-- job_id: job_ESATrddqqNAJ7Whi5VvN7y1TfJh1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:05.716000+00:00
-- started: 2026-08-02T05:46:06.055000+00:00
-- ended: 2026-08-02T05:46:06.912000+00:00

DELETE FROM `MS_Ads_CL_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
