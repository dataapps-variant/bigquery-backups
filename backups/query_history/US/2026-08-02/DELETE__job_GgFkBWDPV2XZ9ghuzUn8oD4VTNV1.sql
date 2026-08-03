-- job_id: job_GgFkBWDPV2XZ9ghuzUn8oD4VTNV1
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:04.520000+00:00
-- started: 2026-08-02T05:46:04.839000+00:00
-- ended: 2026-08-02T05:46:05.713000+00:00

DELETE FROM `MS_Ads_EN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
