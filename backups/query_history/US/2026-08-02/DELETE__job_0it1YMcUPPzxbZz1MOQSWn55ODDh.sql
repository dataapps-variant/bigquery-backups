-- job_id: job_0it1YMcUPPzxbZz1MOQSWn55ODDh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:04.536000+00:00
-- started: 2026-08-02T05:46:04.881000+00:00
-- ended: 2026-08-02T05:46:05.823000+00:00

DELETE FROM `MS_Ads_EN_AdPerformanceDailyReport` WHERE `Date` >= @p0
