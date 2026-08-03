-- job_id: job_SBX3uG-uOxRlVTeS-yqk_mTxbFpE
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:00.862000+00:00
-- started: 2026-08-01T05:46:01.232000+00:00
-- ended: 2026-08-01T05:46:02.150000+00:00

DELETE FROM `MS_Ads_IQ_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
