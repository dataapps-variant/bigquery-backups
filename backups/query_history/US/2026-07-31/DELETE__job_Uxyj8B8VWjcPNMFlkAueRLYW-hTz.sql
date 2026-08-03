-- job_id: job_Uxyj8B8VWjcPNMFlkAueRLYW-hTz
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:17.168000+00:00
-- started: 2026-07-31T05:46:17.533000+00:00
-- ended: 2026-07-31T05:46:18.526000+00:00

DELETE FROM `Linkedin_AdsDailyReport` WHERE `Date` >= @p0
