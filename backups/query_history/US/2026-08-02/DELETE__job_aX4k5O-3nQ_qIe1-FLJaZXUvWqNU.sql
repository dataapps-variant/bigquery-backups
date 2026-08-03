-- job_id: job_aX4k5O-3nQ_qIe1-FLJaZXUvWqNU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:57.948000+00:00
-- started: 2026-08-02T05:45:58.258000+00:00
-- ended: 2026-08-02T05:45:59.146000+00:00

DELETE FROM `MS_Ads_RT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
