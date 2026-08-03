-- job_id: job_kq3ioJitzasoRtrpkoB3Mi0Fv7H1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:58.847000+00:00
-- started: 2026-08-03T05:45:59.213000+00:00
-- ended: 2026-08-03T05:46:00.174000+00:00

DELETE FROM `MS_Ads_JF_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
