-- job_id: job_VXGb2Lj5KWSPA_D4CsSiGMMxcEBG
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:12.899000+00:00
-- started: 2026-08-03T05:46:13.180000+00:00
-- ended: 2026-08-03T05:46:14.224000+00:00

DELETE FROM `Linkedin_AdsDailyReport` WHERE `Date` >= @p0
