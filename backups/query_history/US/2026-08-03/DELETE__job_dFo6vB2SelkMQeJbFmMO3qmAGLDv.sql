-- job_id: job_dFo6vB2SelkMQeJbFmMO3qmAGLDv
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:59.646000+00:00
-- started: 2026-08-03T05:45:59.928000+00:00
-- ended: 2026-08-03T05:46:01.396000+00:00

DELETE FROM `TikTok_CT_AdsDailyReport` WHERE `Date` >= @p0
