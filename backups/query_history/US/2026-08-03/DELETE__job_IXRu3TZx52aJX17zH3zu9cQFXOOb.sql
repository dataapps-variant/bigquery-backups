-- job_id: job_IXRu3TZx52aJX17zH3zu9cQFXOOb
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:54.421000+00:00
-- started: 2026-08-03T05:45:55.055000+00:00
-- ended: 2026-08-03T05:45:56.001000+00:00

DELETE FROM `MS_Ads_IQ_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
