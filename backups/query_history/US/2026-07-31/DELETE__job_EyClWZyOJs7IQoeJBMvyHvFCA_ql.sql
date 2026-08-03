-- job_id: job_EyClWZyOJs7IQoeJBMvyHvFCA_ql
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:03.676000+00:00
-- started: 2026-07-31T05:46:04.032000+00:00
-- ended: 2026-07-31T05:46:04.935000+00:00

DELETE FROM `Facebook_Ads_CT_DailyAdInsights` WHERE `DateStart` >= @p0
