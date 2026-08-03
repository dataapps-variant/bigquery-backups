-- job_id: job_VUumzXKk4M0PsROtdBZLjpJpXpN8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:01.397000+00:00
-- started: 2026-08-02T05:46:01.689000+00:00
-- ended: 2026-08-02T05:46:02.530000+00:00

DELETE FROM `MS_Ads_CT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
