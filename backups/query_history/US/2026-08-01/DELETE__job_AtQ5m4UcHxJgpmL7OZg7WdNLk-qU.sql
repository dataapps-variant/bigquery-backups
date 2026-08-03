-- job_id: job_AtQ5m4UcHxJgpmL7OZg7WdNLk-qU
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:22.372000+00:00
-- started: 2026-08-01T05:46:22.699000+00:00
-- ended: 2026-08-01T05:46:23.561000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
