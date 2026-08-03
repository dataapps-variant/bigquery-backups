-- job_id: job_5fo70ZkK8JJ_p5C4UU9Rt7DMDMps
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:04.759000+00:00
-- started: 2026-07-28T05:46:05.167000+00:00
-- ended: 2026-07-28T05:46:06.223000+00:00

DELETE FROM `MS_Ads_IQ_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
