-- job_id: job_NTYJMljGct4qZHapvBYT34GuIj1h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:04.182000+00:00
-- started: 2026-08-01T05:46:04.475000+00:00
-- ended: 2026-08-01T05:46:05.335000+00:00

DELETE FROM `MS_Ads_EN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
