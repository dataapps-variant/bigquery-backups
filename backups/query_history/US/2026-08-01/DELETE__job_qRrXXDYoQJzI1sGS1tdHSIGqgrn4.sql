-- job_id: job_qRrXXDYoQJzI1sGS1tdHSIGqgrn4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:05.335000+00:00
-- started: 2026-08-01T05:46:05.987000+00:00
-- ended: 2026-08-01T05:46:06.917000+00:00

DELETE FROM `MS_Ads_PD_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
