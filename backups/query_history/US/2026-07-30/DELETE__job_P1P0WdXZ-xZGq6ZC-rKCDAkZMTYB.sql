-- job_id: job_P1P0WdXZ-xZGq6ZC-rKCDAkZMTYB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:13.915000+00:00
-- started: 2026-07-30T05:46:14.204000+00:00
-- ended: 2026-07-30T05:46:15.597000+00:00

DELETE FROM `MS_Ads_EN_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
