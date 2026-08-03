-- job_id: job_qv3w27Kn1HInG7bO9dKpDP5K4Cij
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:04.708000+00:00
-- started: 2026-08-02T05:46:05.029000+00:00
-- ended: 2026-08-02T05:46:06.055000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
