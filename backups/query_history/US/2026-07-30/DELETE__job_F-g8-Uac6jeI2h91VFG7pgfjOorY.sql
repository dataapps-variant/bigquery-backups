-- job_id: job_F-g8-Uac6jeI2h91VFG7pgfjOorY
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:25.897000+00:00
-- started: 2026-07-30T05:46:26.300000+00:00
-- ended: 2026-07-30T05:46:27.299000+00:00

DELETE FROM `MS_Ads_PD_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
