-- job_id: job_bPORDzBern6v3oUA78b2Np41EQJN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:06.454000+00:00
-- started: 2026-08-03T05:46:06.795000+00:00
-- ended: 2026-08-03T05:46:07.718000+00:00

DELETE FROM `MS_Ads_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
