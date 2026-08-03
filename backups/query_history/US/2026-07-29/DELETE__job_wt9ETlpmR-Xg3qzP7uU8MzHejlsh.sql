-- job_id: job_wt9ETlpmR-Xg3qzP7uU8MzHejlsh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:45:58.696000+00:00
-- started: 2026-07-29T05:45:59.127000+00:00
-- ended: 2026-07-29T05:46:00.287000+00:00

DELETE FROM `MS_Ads_RT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
