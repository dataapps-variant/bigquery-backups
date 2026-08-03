-- job_id: job_uAuVti1V1mB0FtLbt82sV8pFQHGz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:11.202000+00:00
-- started: 2026-08-01T05:46:11.640000+00:00
-- ended: 2026-08-01T05:46:12.648000+00:00

DELETE FROM `MS_Ads_JF_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
