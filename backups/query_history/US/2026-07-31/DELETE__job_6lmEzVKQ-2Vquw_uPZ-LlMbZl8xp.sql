-- job_id: job_6lmEzVKQ-2Vquw_uPZ-LlMbZl8xp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:02.521000+00:00
-- started: 2026-07-31T05:46:02.881000+00:00
-- ended: 2026-07-31T05:46:04.035000+00:00

DELETE FROM `TikTok_DT_AdsDailyReport` WHERE `Date` >= @p0
