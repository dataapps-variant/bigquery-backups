-- job_id: job_cZ1Y34KoLzPZWVwEajsUwJzrWI-s
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:18.395000+00:00
-- started: 2026-07-29T05:46:18.790000+00:00
-- ended: 2026-07-29T05:46:19.777000+00:00

DELETE FROM `MS_Ads_CL_AdPerformanceDailyReport` WHERE `Date` >= @p0
