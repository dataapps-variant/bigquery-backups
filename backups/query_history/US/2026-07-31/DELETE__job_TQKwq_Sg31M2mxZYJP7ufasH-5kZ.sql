-- job_id: job_TQKwq_Sg31M2mxZYJP7ufasH-5kZ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:25.079000+00:00
-- started: 2026-07-31T05:46:25.330000+00:00
-- ended: 2026-07-31T05:46:26.430000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
