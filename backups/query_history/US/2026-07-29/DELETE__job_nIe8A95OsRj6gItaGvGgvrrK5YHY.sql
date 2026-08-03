-- job_id: job_nIe8A95OsRj6gItaGvGgvrrK5YHY
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:00.543000+00:00
-- started: 2026-07-29T05:46:00.879000+00:00
-- ended: 2026-07-29T05:46:01.854000+00:00

DELETE FROM `MS_Ads_CN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
