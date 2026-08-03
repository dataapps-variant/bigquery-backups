-- job_id: job_2l9y346HRhWSruxNzaHgVGt8C6F8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:12.437000+00:00
-- started: 2026-07-28T05:46:12.717000+00:00
-- ended: 2026-07-28T05:46:13.667000+00:00

DELETE FROM `MS_Ads_PD_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
