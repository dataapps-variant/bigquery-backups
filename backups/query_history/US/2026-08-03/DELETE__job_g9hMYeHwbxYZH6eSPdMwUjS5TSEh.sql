-- job_id: job_g9hMYeHwbxYZH6eSPdMwUjS5TSEh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:56.604000+00:00
-- started: 2026-08-03T05:45:56.951000+00:00
-- ended: 2026-08-03T05:45:57.879000+00:00

DELETE FROM `MS_Ads_AT_AdPerformanceDailyReport` WHERE `Date` >= @p0
