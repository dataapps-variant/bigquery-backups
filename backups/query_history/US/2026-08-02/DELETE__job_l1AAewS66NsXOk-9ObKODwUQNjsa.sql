-- job_id: job_l1AAewS66NsXOk-9ObKODwUQNjsa
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:12.281000+00:00
-- started: 2026-08-02T05:46:12.614000+00:00
-- ended: 2026-08-02T05:46:13.490000+00:00

DELETE FROM `MS_Ads_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
