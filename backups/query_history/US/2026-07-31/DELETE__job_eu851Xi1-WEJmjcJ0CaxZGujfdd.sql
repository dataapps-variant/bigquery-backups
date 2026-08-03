-- job_id: job_eu851Xi1-WEJmjcJ0CaxZGujfdd_
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:00.477000+00:00
-- started: 2026-07-31T05:46:00.861000+00:00
-- ended: 2026-07-31T05:46:01.812000+00:00

DELETE FROM `MS_Ads_IQ_AdPerformanceDailyReport` WHERE `Date` >= @p0
