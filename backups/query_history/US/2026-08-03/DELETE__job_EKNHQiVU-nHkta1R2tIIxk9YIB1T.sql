-- job_id: job_EKNHQiVU-nHkta1R2tIIxk9YIB1T
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:02.088000+00:00
-- started: 2026-08-03T05:46:02.396000+00:00
-- ended: 2026-08-03T05:46:03.376000+00:00

DELETE FROM `MS_Ads_EN_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
