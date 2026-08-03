-- job_id: job_lR-7h7B5LE9_ryx12l4FToNi0wZH
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:06.846000+00:00
-- started: 2026-07-30T05:46:07.178000+00:00
-- ended: 2026-07-30T05:46:08.091000+00:00

DELETE FROM `MS_Ads_JF_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
