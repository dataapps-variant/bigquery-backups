-- job_id: job_kAsIiQnqkbCTfBnrUFFP1I79iGWJ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:21.741000+00:00
-- started: 2026-08-01T05:46:22.036000+00:00
-- ended: 2026-08-01T05:46:23.528000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
