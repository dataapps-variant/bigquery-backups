-- job_id: job_UGI7mcrBNJgzmFj36BmrclCtQxYH
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:05.264000+00:00
-- started: 2026-07-31T05:46:05.562000+00:00
-- ended: 2026-07-31T05:46:06.509000+00:00

DELETE FROM `MS_Ads_JF_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
