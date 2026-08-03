-- job_id: job_YivLAu-YwxUDFzKZLPYwn3ZMYNnc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:01.386000+00:00
-- started: 2026-07-31T05:46:01.867000+00:00
-- ended: 2026-07-31T05:46:02.774000+00:00

DELETE FROM `MS_Ads_AT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
