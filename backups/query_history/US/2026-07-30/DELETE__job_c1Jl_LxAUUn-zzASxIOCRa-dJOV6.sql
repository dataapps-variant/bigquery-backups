-- job_id: job_c1Jl_LxAUUn-zzASxIOCRa-dJOV6
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:15.237000+00:00
-- started: 2026-07-30T05:46:15.570000+00:00
-- ended: 2026-07-30T05:46:16.573000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
