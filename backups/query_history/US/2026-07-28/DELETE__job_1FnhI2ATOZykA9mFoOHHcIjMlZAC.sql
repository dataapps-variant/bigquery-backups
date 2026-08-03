-- job_id: job_1FnhI2ATOZykA9mFoOHHcIjMlZAC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:08.317000+00:00
-- started: 2026-07-28T05:46:08.657000+00:00
-- ended: 2026-07-28T05:46:09.924000+00:00

DELETE FROM `MS_Ads_EN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
