-- job_id: job_oXt1zrsu0wwJ3AL91-yRJTzzu5Wn
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:56.043000+00:00
-- started: 2026-08-03T05:45:56.394000+00:00
-- ended: 2026-08-03T05:45:57.317000+00:00

DELETE FROM `MS_Ads_CN_AdPerformanceDailyReport` WHERE `Date` >= @p0
