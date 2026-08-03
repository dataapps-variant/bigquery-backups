-- job_id: job_qXG3hnUSwKYAZYJDAOu3J5fHWPA8
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:10.248000+00:00
-- started: 2026-07-29T05:46:10.625000+00:00
-- ended: 2026-07-29T05:46:11.532000+00:00

DELETE FROM `TikTok_DT_AdsDailyReport` WHERE `Date` >= @p0
