-- job_id: job_EI7_XwF-sAaSf-WbRsLwvbx2rgfh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:09.484000+00:00
-- started: 2026-07-31T05:46:09.782000+00:00
-- ended: 2026-07-31T05:46:10.625000+00:00

DELETE FROM `MS_Ads_CL_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
