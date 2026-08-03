-- job_id: job__bK_jFsI2jiK9AoqVfZvxrsMhIZ9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:08.826000+00:00
-- started: 2026-08-01T05:46:09.121000+00:00
-- ended: 2026-08-01T05:46:10.186000+00:00

DELETE FROM `MS_Ads_CT_AdPerformanceDailyReport` WHERE `Date` >= @p0
