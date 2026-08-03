-- job_id: job_3tE5bmuXurUB9_YS6JMsXjcREJLK
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:06.389000+00:00
-- started: 2026-07-28T05:46:06.738000+00:00
-- ended: 2026-07-28T05:46:07.789000+00:00

DELETE FROM `MS_Ads_CT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
