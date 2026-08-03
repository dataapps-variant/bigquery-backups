-- job_id: job_Q62WZ_G2rBrVhIBY2qHvQdZ-mmhA
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:45:58.609000+00:00
-- started: 2026-07-29T05:45:59.217000+00:00
-- ended: 2026-07-29T05:46:00.222000+00:00

DELETE FROM `MS_Ads_RT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
