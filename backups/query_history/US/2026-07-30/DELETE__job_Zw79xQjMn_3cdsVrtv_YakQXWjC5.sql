-- job_id: job_Zw79xQjMn_3cdsVrtv_YakQXWjC5
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:00.164000+00:00
-- started: 2026-07-30T05:46:00.566000+00:00
-- ended: 2026-07-30T05:46:01.587000+00:00

DELETE FROM `MS_Ads_RT_AdPerformanceDailyReport` WHERE `Date` >= @p0
