-- job_id: job_vgvK1AJl24ZmA08_v-QLB4H040iQ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:04.574000+00:00
-- started: 2026-08-01T05:46:04.987000+00:00
-- ended: 2026-08-01T05:46:06.125000+00:00

DELETE FROM `TikTok_CT_AdsDailyReport` WHERE `Date` >= @p0
