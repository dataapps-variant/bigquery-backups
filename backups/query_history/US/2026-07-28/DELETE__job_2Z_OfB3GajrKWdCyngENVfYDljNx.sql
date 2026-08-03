-- job_id: job_2Z_OfB3GajrKWdCyngENVfYDljNx
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:15.359000+00:00
-- started: 2026-07-28T05:46:15.681000+00:00
-- ended: 2026-07-28T05:46:16.952000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
