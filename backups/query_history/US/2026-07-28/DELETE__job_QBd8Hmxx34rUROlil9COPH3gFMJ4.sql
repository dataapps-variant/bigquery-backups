-- job_id: job_QBd8Hmxx34rUROlil9COPH3gFMJ4
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:15.204000+00:00
-- started: 2026-07-28T05:46:15.498000+00:00
-- ended: 2026-07-28T05:46:16.550000+00:00

DELETE FROM `TikTok_JF_AdsDailyReport` WHERE `Date` >= @p0
