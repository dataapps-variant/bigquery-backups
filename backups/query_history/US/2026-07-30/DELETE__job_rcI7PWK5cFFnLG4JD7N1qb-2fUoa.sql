-- job_id: job_rcI7PWK5cFFnLG4JD7N1qb-2fUoa
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:00.311000+00:00
-- started: 2026-07-30T05:46:00.705000+00:00
-- ended: 2026-07-30T05:46:01.819000+00:00

DELETE FROM `MS_Ads_IQ_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
