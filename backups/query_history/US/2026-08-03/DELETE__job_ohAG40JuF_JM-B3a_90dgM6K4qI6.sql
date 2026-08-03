-- job_id: job_ohAG40JuF_JM-B3a_90dgM6K4qI6
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:54.424000+00:00
-- started: 2026-08-03T05:45:54.812000+00:00
-- ended: 2026-08-03T05:45:55.777000+00:00

DELETE FROM `MS_Ads_IQ_AdPerformanceDailyReport` WHERE `Date` >= @p0
