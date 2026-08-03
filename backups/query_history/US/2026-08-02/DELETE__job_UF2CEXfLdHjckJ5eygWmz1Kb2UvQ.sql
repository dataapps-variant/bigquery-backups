-- job_id: job_UF2CEXfLdHjckJ5eygWmz1Kb2UvQ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:04.054000+00:00
-- started: 2026-08-02T05:46:04.447000+00:00
-- ended: 2026-08-02T05:46:05.389000+00:00

DELETE FROM `MS_Ads_CT_AdPerformanceDailyReport` WHERE `Date` >= @p0
