-- job_id: job_1GJvx5DrlBBJyj-P1XGkLS_IBAXS
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:00.871000+00:00
-- started: 2026-08-03T05:46:01.272000+00:00
-- ended: 2026-08-03T05:46:03.292000+00:00

DELETE FROM `MS_Ads_EN_AdPerformanceDailyReport` WHERE `Date` >= @p0
