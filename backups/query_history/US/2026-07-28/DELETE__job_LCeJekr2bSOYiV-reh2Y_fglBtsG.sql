-- job_id: job_LCeJekr2bSOYiV-reh2Y_fglBtsG
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:22.861000+00:00
-- started: 2026-07-28T05:46:23.159000+00:00
-- ended: 2026-07-28T05:46:24.084000+00:00

DELETE FROM `Linkedin_AdsDailyReport` WHERE `Date` >= @p0
