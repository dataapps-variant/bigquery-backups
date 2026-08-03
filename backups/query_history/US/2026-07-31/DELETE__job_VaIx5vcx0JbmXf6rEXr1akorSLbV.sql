-- job_id: job_VaIx5vcx0JbmXf6rEXr1akorSLbV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:06.645000+00:00
-- started: 2026-07-31T05:46:06.969000+00:00
-- ended: 2026-07-31T05:46:07.891000+00:00

DELETE FROM `MS_Ads_PD_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
