-- job_id: job_4uvfpd-u6gqvDjagfrt8jHhv6Z3N
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:13.032000+00:00
-- started: 2026-07-28T05:46:13.332000+00:00
-- ended: 2026-07-28T05:46:15.576000+00:00

DELETE FROM `MS_Ads_CL_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
