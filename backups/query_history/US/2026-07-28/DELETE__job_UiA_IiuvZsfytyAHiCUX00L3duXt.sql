-- job_id: job_UiA_IiuvZsfytyAHiCUX00L3duXt
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:15.082000+00:00
-- started: 2026-07-28T05:46:15.503000+00:00
-- ended: 2026-07-28T05:46:16.479000+00:00

DELETE FROM `MS_Ads_FS_AdPerformanceDailyReport` WHERE `Date` >= @p0
