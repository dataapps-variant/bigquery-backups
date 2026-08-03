-- job_id: job_LckorgSS5kTWT-REKtLZt5av2O49
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:00.767000+00:00
-- started: 2026-07-28T05:46:01.183000+00:00
-- ended: 2026-07-28T05:46:02.178000+00:00

DELETE FROM `MS_Ads_AT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
