-- job_id: job_9uy3A1B6tht45wQ9B3ZlwzoF7OkG
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:45:58.568000+00:00
-- started: 2026-07-29T05:45:59.062000+00:00
-- ended: 2026-07-29T05:45:59.988000+00:00

DELETE FROM `MS_Ads_RT_AdPerformanceDailyReport` WHERE `Date` >= @p0
