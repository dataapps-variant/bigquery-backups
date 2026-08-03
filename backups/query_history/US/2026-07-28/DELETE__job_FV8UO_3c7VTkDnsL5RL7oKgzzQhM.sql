-- job_id: job_FV8UO_3c7VTkDnsL5RL7oKgzzQhM
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:14.536000+00:00
-- started: 2026-07-28T05:46:14.820000+00:00
-- ended: 2026-07-28T05:46:16.020000+00:00

DELETE FROM `MS_Ads_FS_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
