-- job_id: job_lM6OOhGMZE_kHdqONCZIz_deFIaa
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:12.603000+00:00
-- started: 2026-07-30T05:46:12.932000+00:00
-- ended: 2026-07-30T05:46:13.893000+00:00

DELETE FROM `MS_Ads_EN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
