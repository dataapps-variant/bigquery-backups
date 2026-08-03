-- job_id: job_VxTP6kaqMkbApUZ6GWGyj5CPxyPL
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:07.973000+00:00
-- started: 2026-08-01T05:46:08.262000+00:00
-- ended: 2026-08-01T05:46:09.237000+00:00

DELETE FROM `MS_Ads_CT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
