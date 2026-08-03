-- job_id: job_r8FHTDPfc-C1mCZAAzBPYinSzQr3
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:00.656000+00:00
-- started: 2026-08-01T05:46:01.032000+00:00
-- ended: 2026-08-01T05:46:02.325000+00:00

DELETE FROM `MS_Ads_RT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
