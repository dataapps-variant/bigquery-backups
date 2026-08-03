-- job_id: job_MjArVURQyKGukxN8yoSBrXdQ1UFm
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:56.148000+00:00
-- started: 2026-08-02T05:45:56.578000+00:00
-- ended: 2026-08-02T05:45:57.490000+00:00

DELETE FROM `MS_Ads_AT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
