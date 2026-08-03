-- job_id: job_eIrkhwq4PrbURq45srtz6affqtWN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:17.033000+00:00
-- started: 2026-07-29T05:46:17.334000+00:00
-- ended: 2026-07-29T05:46:18.225000+00:00

DELETE FROM `Linkedin_AdsDailyReport` WHERE `Date` >= @p0
