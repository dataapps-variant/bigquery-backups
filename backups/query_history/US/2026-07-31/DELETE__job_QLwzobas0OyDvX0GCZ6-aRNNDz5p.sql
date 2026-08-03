-- job_id: job_QLwzobas0OyDvX0GCZ6-aRNNDz5p
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:07.663000+00:00
-- started: 2026-07-31T05:46:07.991000+00:00
-- ended: 2026-07-31T05:46:08.918000+00:00

DELETE FROM `MS_Ads_CL_AdPerformanceDailyReport` WHERE `Date` >= @p0
