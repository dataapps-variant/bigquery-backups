-- job_id: job_g709vtZYnkJs7GgCgUD3rqPxViDd
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:05.971000+00:00
-- started: 2026-07-30T05:46:06.307000+00:00
-- ended: 2026-07-30T05:46:07.252000+00:00

DELETE FROM `MS_Ads_FS_AdPerformanceDailyReport` WHERE `Date` >= @p0
