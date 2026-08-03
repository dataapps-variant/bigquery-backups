-- job_id: job__sQrhYsNIAIufcgf5zh93bWxjta5
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:06.903000+00:00
-- started: 2026-08-01T05:46:07.229000+00:00
-- ended: 2026-08-01T05:46:08.143000+00:00

DELETE FROM `MS_Ads_CL_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
