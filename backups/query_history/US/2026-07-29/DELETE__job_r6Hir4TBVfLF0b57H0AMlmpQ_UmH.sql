-- job_id: job_r6Hir4TBVfLF0b57H0AMlmpQ_UmH
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:07.106000+00:00
-- started: 2026-07-29T05:46:07.477000+00:00
-- ended: 2026-07-29T05:46:08.490000+00:00

DELETE FROM `Facebook_Ads_CT_DailyAdInsights` WHERE `DateStart` >= @p0
