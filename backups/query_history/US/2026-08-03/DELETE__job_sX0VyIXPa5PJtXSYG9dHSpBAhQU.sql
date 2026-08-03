-- job_id: job_sX0VyIXPa5PJtXSYG9dHSpBAhQU_
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:01.935000+00:00
-- started: 2026-08-03T05:46:02.286000+00:00
-- ended: 2026-08-03T05:46:03.184000+00:00

DELETE FROM `MS_Ads_EN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
