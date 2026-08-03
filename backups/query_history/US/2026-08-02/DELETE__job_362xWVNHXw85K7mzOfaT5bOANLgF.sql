-- job_id: job_362xWVNHXw85K7mzOfaT5bOANLgF
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:03.641000+00:00
-- started: 2026-08-02T05:46:03.965000+00:00
-- ended: 2026-08-02T05:46:04.894000+00:00

DELETE FROM `MS_Ads_FS_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
