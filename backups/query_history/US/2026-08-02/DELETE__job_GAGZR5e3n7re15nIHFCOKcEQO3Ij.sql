-- job_id: job_GAGZR5e3n7re15nIHFCOKcEQO3Ij
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:05.453000+00:00
-- started: 2026-08-02T05:46:05.786000+00:00
-- ended: 2026-08-02T05:46:06.668000+00:00

DELETE FROM `MS_Ads_CL_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
