-- job_id: job_0-hDCxYWsYEUnEUMrc488eCEnN_l
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:05.474000+00:00
-- started: 2026-07-30T05:46:05.894000+00:00
-- ended: 2026-07-30T05:46:07.151000+00:00

DELETE FROM `Facebook_Ads_CT_DailyAdInsights` WHERE `DateStart` >= @p0
