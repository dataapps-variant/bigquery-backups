-- job_id: job_hbaCVQxa3Hp_JCTfRjaOvWPmrg3O
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:00.114000+00:00
-- started: 2026-08-03T05:46:00.482000+00:00
-- ended: 2026-08-03T05:46:01.352000+00:00

DELETE FROM `MS_Ads_JF_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
