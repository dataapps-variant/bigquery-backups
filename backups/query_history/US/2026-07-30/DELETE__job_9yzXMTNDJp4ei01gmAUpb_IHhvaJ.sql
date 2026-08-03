-- job_id: job_9yzXMTNDJp4ei01gmAUpb_IHhvaJ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:00.163000+00:00
-- started: 2026-07-30T05:46:00.559000+00:00
-- ended: 2026-07-30T05:46:04.936000+00:00

DELETE FROM `MS_Ads_RT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
