-- job_id: job_aqMAsHw5hLSII7NB0T7qSzsnvVXl
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:00.548000+00:00
-- started: 2026-07-31T05:46:00.895000+00:00
-- ended: 2026-07-31T05:46:01.764000+00:00

DELETE FROM `MS_Ads_IQ_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
