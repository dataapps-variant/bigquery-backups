-- job_id: job_OQ-MkWvt1RVfSgyOibFyPJ1V0MLB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:22.141000+00:00
-- started: 2026-08-03T05:46:22.470000+00:00
-- ended: 2026-08-03T05:46:23.470000+00:00

DELETE FROM `MS_Ads_CL_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
