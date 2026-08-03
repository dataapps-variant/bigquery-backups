-- job_id: job_L87gTuGepUQveBTSaJGy2jQWq0bq
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:10.949000+00:00
-- started: 2026-07-29T05:46:11.248000+00:00
-- ended: 2026-07-29T05:46:12.126000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
