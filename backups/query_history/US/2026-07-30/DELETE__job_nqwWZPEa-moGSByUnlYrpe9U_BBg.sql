-- job_id: job_nqwWZPEa-moGSByUnlYrpe9U_BBg
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:04.106000+00:00
-- started: 2026-07-30T05:46:04.411000+00:00
-- ended: 2026-07-30T05:46:05.358000+00:00

DELETE FROM `MS_Ads_CT_AdPerformanceDailyReport` WHERE `Date` >= @p0
