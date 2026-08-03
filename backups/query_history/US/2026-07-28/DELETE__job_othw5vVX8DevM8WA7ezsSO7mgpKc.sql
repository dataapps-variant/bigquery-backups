-- job_id: job_othw5vVX8DevM8WA7ezsSO7mgpKc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:27.451000+00:00
-- started: 2026-07-28T05:46:27.815000+00:00
-- ended: 2026-07-28T05:46:30.442000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
