-- job_id: job_QyVRTWC9JhjJ0gN8N2jY9EtQYvNn
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:00.432000+00:00
-- started: 2026-08-03T05:46:00.803000+00:00
-- ended: 2026-08-03T05:46:01.756000+00:00

DELETE FROM `MS_Ads_PD_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
