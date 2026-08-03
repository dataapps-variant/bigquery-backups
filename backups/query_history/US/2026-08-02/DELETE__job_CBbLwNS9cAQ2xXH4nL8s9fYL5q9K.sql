-- job_id: job_CBbLwNS9cAQ2xXH4nL8s9fYL5q9K
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:58.279000+00:00
-- started: 2026-08-02T05:45:58.612000+00:00
-- ended: 2026-08-02T05:45:59.417000+00:00

DELETE FROM `MS_Ads_CN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
