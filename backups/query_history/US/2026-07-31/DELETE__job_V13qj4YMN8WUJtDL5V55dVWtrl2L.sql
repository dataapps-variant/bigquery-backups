-- job_id: job_V13qj4YMN8WUJtDL5V55dVWtrl2L
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:17.173000+00:00
-- started: 2026-07-31T05:46:17.492000+00:00
-- ended: 2026-07-31T05:46:18.499000+00:00

DELETE FROM `Facebook_Ads_AT_DailyAdInsights` WHERE `DateStart` >= @p0
