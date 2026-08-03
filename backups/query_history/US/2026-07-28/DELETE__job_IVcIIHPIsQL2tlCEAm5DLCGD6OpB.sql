-- job_id: job_IVcIIHPIsQL2tlCEAm5DLCGD6OpB
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:45:59.770000+00:00
-- started: 2026-07-28T05:46:00.075000+00:00
-- ended: 2026-07-28T05:46:03.508000+00:00

DELETE FROM `MS_Ads_RT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
