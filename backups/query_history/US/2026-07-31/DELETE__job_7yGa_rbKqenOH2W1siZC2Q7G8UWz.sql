-- job_id: job_7yGa_rbKqenOH2W1siZC2Q7G8UWz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:00.486000+00:00
-- started: 2026-07-31T05:46:00.848000+00:00
-- ended: 2026-07-31T05:46:01.773000+00:00

DELETE FROM `MS_Ads_CN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
