-- job_id: job_IbdeJPxXdRJJCu8rIx58tjqtoB2r
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:14.879000+00:00
-- started: 2026-08-01T05:46:15.199000+00:00
-- ended: 2026-08-01T05:46:16.107000+00:00

DELETE FROM `Linkedin_AdsDailyReport` WHERE `Date` >= @p0
