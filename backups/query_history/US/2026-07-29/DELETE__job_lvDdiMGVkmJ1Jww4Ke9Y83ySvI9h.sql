-- job_id: job_lvDdiMGVkmJ1Jww4Ke9Y83ySvI9h
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:08.162000+00:00
-- started: 2026-07-29T05:46:08.508000+00:00
-- ended: 2026-07-29T05:46:09.716000+00:00

DELETE FROM `MS_Ads_CL_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
