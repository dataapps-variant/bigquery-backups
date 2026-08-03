-- job_id: job_kiSvjH6OIUUWcKA3p2x5aUGPPcv2
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:06.624000+00:00
-- started: 2026-07-30T05:46:07.091000+00:00
-- ended: 2026-07-30T05:46:08.091000+00:00

DELETE FROM `MS_Ads_FS_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
