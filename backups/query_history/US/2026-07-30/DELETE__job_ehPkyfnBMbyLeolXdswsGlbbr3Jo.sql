-- job_id: job_ehPkyfnBMbyLeolXdswsGlbbr3Jo
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:01.811000+00:00
-- started: 2026-07-30T05:46:02.441000+00:00
-- ended: 2026-07-30T05:46:03.372000+00:00

DELETE FROM `MS_Ads_CN_AdPerformanceDailyReport` WHERE `Date` >= @p0
