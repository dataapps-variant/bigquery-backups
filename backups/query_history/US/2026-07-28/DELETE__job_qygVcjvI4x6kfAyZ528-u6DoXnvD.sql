-- job_id: job_qygVcjvI4x6kfAyZ528-u6DoXnvD
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:06.164000+00:00
-- started: 2026-07-28T05:46:06.520000+00:00
-- ended: 2026-07-28T05:46:07.564000+00:00

DELETE FROM `MS_Ads_CN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
