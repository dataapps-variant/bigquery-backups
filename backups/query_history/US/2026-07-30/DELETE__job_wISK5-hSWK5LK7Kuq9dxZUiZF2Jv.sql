-- job_id: job_wISK5-hSWK5LK7Kuq9dxZUiZF2Jv
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:47:40.463000+00:00
-- started: 2026-07-30T05:47:40.781000+00:00
-- ended: 2026-07-30T05:47:41.906000+00:00

DELETE FROM `Facebook_Ads_JF_DailyAdInsights` WHERE `DateStart` >= @p0
