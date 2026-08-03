-- job_id: job_mkCwjSQiDNyH5SV_IeJSgZHw7Evo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:00.849000+00:00
-- started: 2026-08-01T05:46:01.188000+00:00
-- ended: 2026-08-01T05:46:02.051000+00:00

DELETE FROM `MS_Ads_IQ_AdPerformanceDailyReport` WHERE `Date` >= @p0
