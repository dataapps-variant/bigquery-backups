-- job_id: job_5GvU-W9jiRZNJ8NYCUMOu6AATJgu
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:56.002000+00:00
-- started: 2026-08-03T05:45:56.372000+00:00
-- ended: 2026-08-03T05:45:57.247000+00:00

DELETE FROM `MS_Ads_CN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
