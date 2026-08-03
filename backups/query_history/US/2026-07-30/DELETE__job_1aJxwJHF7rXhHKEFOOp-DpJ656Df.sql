-- job_id: job_1aJxwJHF7rXhHKEFOOp-DpJ656Df
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:07.345000+00:00
-- started: 2026-07-30T05:46:07.699000+00:00
-- ended: 2026-07-30T05:46:08.699000+00:00

DELETE FROM `MS_Ads_FS_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
