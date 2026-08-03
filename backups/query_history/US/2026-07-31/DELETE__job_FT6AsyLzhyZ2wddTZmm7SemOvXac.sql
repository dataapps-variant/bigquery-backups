-- job_id: job_FT6AsyLzhyZ2wddTZmm7SemOvXac
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:01.488000+00:00
-- started: 2026-07-31T05:46:01.834000+00:00
-- ended: 2026-07-31T05:46:02.718000+00:00

DELETE FROM `MS_Ads_RT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
