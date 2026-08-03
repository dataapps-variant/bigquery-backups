-- job_id: job_OSgRweBlfsyOUJkcM47JaMURxZNo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:04.162000+00:00
-- started: 2026-08-02T05:46:04.432000+00:00
-- ended: 2026-08-02T05:46:05.476000+00:00

DELETE FROM `MS_Ads_PD_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
