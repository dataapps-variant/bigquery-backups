-- job_id: job_Jm1XcW6mJVNbPteNrlhd3lhNm3gX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:17.478000+00:00
-- started: 2026-07-28T05:46:17.760000+00:00
-- ended: 2026-07-28T05:46:18.776000+00:00

DELETE FROM `MS_Ads_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
