-- job_id: job_su3MwKwWmzdh2VdPjfUsI1NYJAzM
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:45:59.908000+00:00
-- started: 2026-08-01T05:46:00.229000+00:00
-- ended: 2026-08-01T05:46:01.151000+00:00

DELETE FROM `MS_Ads_CN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
