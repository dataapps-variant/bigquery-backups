-- job_id: job_4aGLs8BXmTwGg67Abs2izYtw9beZ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:33.884000+00:00
-- started: 2026-07-30T05:46:34.226000+00:00
-- ended: 2026-07-30T05:46:35.311000+00:00

DELETE FROM `MS_Ads_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
