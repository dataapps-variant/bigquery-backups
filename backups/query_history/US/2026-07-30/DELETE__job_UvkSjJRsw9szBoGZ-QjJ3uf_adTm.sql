-- job_id: job_UvkSjJRsw9szBoGZ-QjJ3uf_adTm
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:00.373000+00:00
-- started: 2026-07-30T05:46:00.745000+00:00
-- ended: 2026-07-30T05:46:01.775000+00:00

DELETE FROM `MS_Ads_IQ_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
