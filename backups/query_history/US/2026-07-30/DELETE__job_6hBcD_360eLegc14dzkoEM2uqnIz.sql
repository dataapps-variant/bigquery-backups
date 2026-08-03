-- job_id: job_6hBcD_360eLegc14dzkoEM2uqnIz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:17.195000+00:00
-- started: 2026-07-30T05:46:17.531000+00:00
-- ended: 2026-07-30T05:46:18.652000+00:00

DELETE FROM `Linkedin_AdsDailyReport` WHERE `Date` >= @p0
