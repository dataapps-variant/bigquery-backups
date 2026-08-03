-- job_id: job_RQKo7CDD8AKmmWaKtHdvMbEaQ-Xq
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:09.525000+00:00
-- started: 2026-07-31T05:46:10.033000+00:00
-- ended: 2026-07-31T05:46:10.918000+00:00

DELETE FROM `MS_Ads_CL_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
