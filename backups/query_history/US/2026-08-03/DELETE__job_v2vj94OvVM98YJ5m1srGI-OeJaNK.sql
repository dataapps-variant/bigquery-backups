-- job_id: job_v2vj94OvVM98YJ5m1srGI-OeJaNK
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:59.255000+00:00
-- started: 2026-08-03T05:45:59.638000+00:00
-- ended: 2026-08-03T05:46:00.645000+00:00

DELETE FROM `MS_Ads_PD_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
