-- job_id: job_5XJ5hXeq4t0vzGYrg79F4luNdCsx
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:58.409000+00:00
-- started: 2026-08-03T05:45:58.777000+00:00
-- ended: 2026-08-03T05:45:59.676000+00:00

DELETE FROM `MS_Ads_RT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
