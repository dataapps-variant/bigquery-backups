-- job_id: job_0iy5paPZQBZkIpTpp0CBuLT2yd5G
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:04.252000+00:00
-- started: 2026-07-29T05:46:04.620000+00:00
-- ended: 2026-07-29T05:46:05.616000+00:00

DELETE FROM `MS_Ads_JF_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
