-- job_id: job_d5sllX-M9y59fCFJJkrFOmbQ0QNg
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:10.775000+00:00
-- started: 2026-08-01T05:46:11.311000+00:00
-- ended: 2026-08-01T05:46:12.447000+00:00

DELETE FROM `TikTok_JF_AdsDailyReport` WHERE `Date` >= @p0
