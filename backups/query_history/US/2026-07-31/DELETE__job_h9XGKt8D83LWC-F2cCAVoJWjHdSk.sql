-- job_id: job_h9XGKt8D83LWC-F2cCAVoJWjHdSk
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:03.836000+00:00
-- started: 2026-07-31T05:46:04.142000+00:00
-- ended: 2026-07-31T05:46:05.595000+00:00

DELETE FROM `MS_Ads_CT_AdPerformanceDailyReport` WHERE `Date` >= @p0
