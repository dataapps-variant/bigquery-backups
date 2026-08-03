-- job_id: job_dvcWSvkaPulZJ4Y-X7R-QBAU6U65
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:03.783000+00:00
-- started: 2026-07-31T05:46:04.271000+00:00
-- ended: 2026-07-31T05:46:07.606000+00:00

DELETE FROM `MS_Ads_EN_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
