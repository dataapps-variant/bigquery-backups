-- job_id: job_HQ0dY8lYNAWIdq5RnOCWTvrKmRku
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:12.548000+00:00
-- started: 2026-08-01T05:46:12.892000+00:00
-- ended: 2026-08-01T05:46:13.786000+00:00

DELETE FROM `MS_Ads_FS_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
