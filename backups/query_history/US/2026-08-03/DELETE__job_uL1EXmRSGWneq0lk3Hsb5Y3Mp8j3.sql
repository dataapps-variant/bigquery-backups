-- job_id: job_uL1EXmRSGWneq0lk3Hsb5Y3Mp8j3
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:02.598000+00:00
-- started: 2026-08-03T05:46:02.940000+00:00
-- ended: 2026-08-03T05:46:03.982000+00:00

DELETE FROM `MS_Ads_FS_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
