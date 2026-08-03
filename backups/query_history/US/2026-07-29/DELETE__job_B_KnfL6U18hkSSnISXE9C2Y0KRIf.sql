-- job_id: job_B_KnfL6U18hkSSnISXE9C2Y0KRIf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:08.441000+00:00
-- started: 2026-07-29T05:46:08.783000+00:00
-- ended: 2026-07-29T05:46:11.436000+00:00

DELETE FROM `MS_Ads_FS_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
