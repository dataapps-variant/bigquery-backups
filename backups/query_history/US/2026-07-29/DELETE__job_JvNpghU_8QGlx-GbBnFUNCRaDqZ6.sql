-- job_id: job_JvNpghU_8QGlx-GbBnFUNCRaDqZ6
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:03.066000+00:00
-- started: 2026-07-29T05:46:03.428000+00:00
-- ended: 2026-07-29T05:46:04.421000+00:00

DELETE FROM `MS_Ads_IQ_AdPerformanceDailyReport` WHERE `Date` >= @p0
