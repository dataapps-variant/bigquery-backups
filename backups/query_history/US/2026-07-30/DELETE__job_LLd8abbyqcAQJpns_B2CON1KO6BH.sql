-- job_id: job_LLd8abbyqcAQJpns_B2CON1KO6BH
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:05.809000+00:00
-- started: 2026-07-30T05:46:06.105000+00:00
-- ended: 2026-07-30T05:46:07.043000+00:00

DELETE FROM `MS_Ads_AT_AdPerformanceDailyReport` WHERE `Date` >= @p0
