-- job_id: job_jDjupOb5UZsRuqjMwmGYuAZGFieC
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:03.306000+00:00
-- started: 2026-08-02T05:46:03.608000+00:00
-- ended: 2026-08-02T05:46:04.490000+00:00

DELETE FROM `Facebook_Ads_CT_DailyAdInsights` WHERE `DateStart` >= @p0
