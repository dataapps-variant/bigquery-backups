-- job_id: job_GO3611cY5mA5x421YpRpMfv_2S82
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:24.920000+00:00
-- started: 2026-07-30T05:46:25.196000+00:00
-- ended: 2026-07-30T05:46:26.170000+00:00

DELETE FROM `MS_Ads_PD_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
