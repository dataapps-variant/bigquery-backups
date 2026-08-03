-- job_id: job_jleBJ0LVOnskuiYiU1Ss6kSGu2eZ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:04.845000+00:00
-- started: 2026-08-02T05:46:05.138000+00:00
-- ended: 2026-08-02T05:46:05.999000+00:00

DELETE FROM `MS_Ads_FS_AdPerformanceDailyReport` WHERE `Date` >= @p0
