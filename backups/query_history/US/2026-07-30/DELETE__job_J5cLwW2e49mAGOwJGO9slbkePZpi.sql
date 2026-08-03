-- job_id: job_J5cLwW2e49mAGOwJGO9slbkePZpi
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:05.864000+00:00
-- started: 2026-07-30T05:46:06.234000+00:00
-- ended: 2026-07-30T05:46:07.124000+00:00

DELETE FROM `MS_Ads_AT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
