-- job_id: job_cfw_mICygFyPyJUuhVxA9jACKhtN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:56.148000+00:00
-- started: 2026-08-02T05:45:56.506000+00:00
-- ended: 2026-08-02T05:45:58.125000+00:00

DELETE FROM `MS_Ads_AT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
