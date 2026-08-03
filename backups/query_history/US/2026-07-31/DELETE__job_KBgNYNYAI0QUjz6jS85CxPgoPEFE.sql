-- job_id: job_KBgNYNYAI0QUjz6jS85CxPgoPEFE
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:00.539000+00:00
-- started: 2026-07-31T05:46:00.901000+00:00
-- ended: 2026-07-31T05:46:01.846000+00:00

DELETE FROM `MS_Ads_CN_AdPerformanceDailyReport` WHERE `Date` >= @p0
