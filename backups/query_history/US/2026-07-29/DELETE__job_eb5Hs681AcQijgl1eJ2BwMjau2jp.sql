-- job_id: job_eb5Hs681AcQijgl1eJ2BwMjau2jp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:07.487000+00:00
-- started: 2026-07-29T05:46:07.812000+00:00
-- ended: 2026-07-29T05:46:08.782000+00:00

DELETE FROM `MS_Ads_CT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
