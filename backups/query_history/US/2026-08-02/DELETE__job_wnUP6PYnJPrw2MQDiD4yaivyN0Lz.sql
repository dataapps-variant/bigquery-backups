-- job_id: job_wnUP6PYnJPrw2MQDiD4yaivyN0Lz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:05.804000+00:00
-- started: 2026-08-02T05:46:06.114000+00:00
-- ended: 2026-08-02T05:46:07.056000+00:00

DELETE FROM `MS_Ads_CL_AdPerformanceDailyReport` WHERE `Date` >= @p0
