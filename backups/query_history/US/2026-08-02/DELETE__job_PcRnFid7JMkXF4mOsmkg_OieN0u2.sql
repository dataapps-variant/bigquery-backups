-- job_id: job_PcRnFid7JMkXF4mOsmkg_OieN0u2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:20.821000+00:00
-- started: 2026-08-02T05:46:21.137000+00:00
-- ended: 2026-08-02T05:46:22.233000+00:00

DELETE FROM `MS_Clicks_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
