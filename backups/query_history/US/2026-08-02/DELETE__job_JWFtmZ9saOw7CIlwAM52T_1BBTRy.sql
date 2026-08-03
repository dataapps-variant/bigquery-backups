-- job_id: job_JWFtmZ9saOw7CIlwAM52T_1BBTRy
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:13.770000+00:00
-- started: 2026-08-02T05:46:14.029000+00:00
-- ended: 2026-08-02T05:46:15.009000+00:00

DELETE FROM `Linkedin_AdsDailyReport` WHERE `Date` >= @p0
