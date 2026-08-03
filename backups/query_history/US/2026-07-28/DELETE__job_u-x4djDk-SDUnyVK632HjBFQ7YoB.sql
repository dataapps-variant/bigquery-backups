-- job_id: job_u-x4djDk-SDUnyVK632HjBFQ7YoB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:14.382000+00:00
-- started: 2026-07-28T05:46:14.680000+00:00
-- ended: 2026-07-28T05:46:15.636000+00:00

DELETE FROM `MS_Ads_FS_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
