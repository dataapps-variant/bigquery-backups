-- job_id: job_MIlQ6OwYtOMxzF_Dk7MzDZ1Pi9EG
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:47:40.248000+00:00
-- started: 2026-07-31T05:47:40.547000+00:00
-- ended: 2026-07-31T05:47:41.903000+00:00

DELETE FROM `Facebook_Ads_JF_DailyAdInsights` WHERE `DateStart` >= @p0
