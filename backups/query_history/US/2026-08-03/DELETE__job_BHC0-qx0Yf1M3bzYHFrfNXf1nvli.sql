-- job_id: job_BHC0-qx0Yf1M3bzYHFrfNXf1nvli
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:19.094000+00:00
-- started: 2026-08-03T05:46:19.442000+00:00
-- ended: 2026-08-03T05:46:58.672000+00:00

DELETE FROM `MS_Clicks_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
