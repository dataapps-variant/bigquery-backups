-- job_id: job_tmTtuHQGPyG4erE4gJt4JoQE_EAy
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:06.265000+00:00
-- started: 2026-07-28T05:46:06.608000+00:00
-- ended: 2026-07-28T05:46:07.639000+00:00

DELETE FROM `MS_Ads_JF_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
