-- job_id: job_OFjJYhPKpu9ISx5Hg0V-ZViLPpRl
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:57.596000+00:00
-- started: 2026-08-02T05:45:58.072000+00:00
-- ended: 2026-08-02T05:45:58.953000+00:00

DELETE FROM `MS_Ads_IQ_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
