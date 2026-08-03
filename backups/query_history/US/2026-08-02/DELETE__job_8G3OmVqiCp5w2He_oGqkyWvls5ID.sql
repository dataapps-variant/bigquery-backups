-- job_id: job_8G3OmVqiCp5w2He_oGqkyWvls5ID
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:57.943000+00:00
-- started: 2026-08-02T05:45:58.272000+00:00
-- ended: 2026-08-02T05:45:59.148000+00:00

DELETE FROM `MS_Ads_RT_AdPerformanceDailyReport` WHERE `Date` >= @p0
