-- job_id: job_2E_UQ5BfbmGrkaxcMEowVnliZqvk
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:03.559000+00:00
-- started: 2026-08-03T05:46:03.868000+00:00
-- ended: 2026-08-03T05:46:05.291000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
