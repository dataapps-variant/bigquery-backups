-- job_id: job_k8jD0QZAex7TC5ANUtEFR1wv9l9U
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:14.685000+00:00
-- started: 2026-08-02T05:46:15.080000+00:00
-- ended: 2026-08-02T05:46:16.108000+00:00

DELETE FROM `MS_Clicks_PD_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
