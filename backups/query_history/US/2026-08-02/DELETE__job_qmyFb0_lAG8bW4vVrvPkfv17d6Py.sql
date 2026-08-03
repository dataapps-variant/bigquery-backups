-- job_id: job_qmyFb0_lAG8bW4vVrvPkfv17d6Py
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:13.748000+00:00
-- started: 2026-08-02T05:46:14.012000+00:00
-- ended: 2026-08-02T05:46:14.790000+00:00

DELETE FROM `Facebook_Ads_AT_DailyAdInsights` WHERE `DateStart` >= @p0
