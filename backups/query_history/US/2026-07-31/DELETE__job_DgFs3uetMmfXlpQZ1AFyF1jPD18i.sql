-- job_id: job_DgFs3uetMmfXlpQZ1AFyF1jPD18i
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:04.918000+00:00
-- started: 2026-07-31T05:46:05.201000+00:00
-- ended: 2026-07-31T05:46:06.036000+00:00

DELETE FROM `MS_Ads_EN_AdPerformanceDailyReport` WHERE `Date` >= @p0
