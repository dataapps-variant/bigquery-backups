-- job_id: job_hN2vqy2zw-JePr-o-Np42XXSNMPn
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:25.427000+00:00
-- started: 2026-07-30T05:46:25.737000+00:00
-- ended: 2026-07-30T05:46:27.100000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
