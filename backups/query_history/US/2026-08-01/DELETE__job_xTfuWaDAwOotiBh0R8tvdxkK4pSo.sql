-- job_id: job_xTfuWaDAwOotiBh0R8tvdxkK4pSo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:08.288000+00:00
-- started: 2026-08-01T05:46:08.709000+00:00
-- ended: 2026-08-01T05:46:09.875000+00:00

DELETE FROM `MS_Ads_CL_AdPerformanceDailyReport` WHERE `Date` >= @p0
