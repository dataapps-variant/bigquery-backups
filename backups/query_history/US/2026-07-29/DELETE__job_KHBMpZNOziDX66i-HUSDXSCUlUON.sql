-- job_id: job_KHBMpZNOziDX66i-HUSDXSCUlUON
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:20.527000+00:00
-- started: 2026-07-29T05:46:20.794000+00:00
-- ended: 2026-07-29T05:46:21.794000+00:00

DELETE FROM `Facebook_Ads_AT_DailyAdInsights` WHERE `DateStart` >= @p0
