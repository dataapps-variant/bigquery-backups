-- job_id: job_1lTrAMRvh-FyoOgUyYxJYLMv-4-B
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:13.869000+00:00
-- started: 2026-07-31T05:46:14.191000+00:00
-- ended: 2026-07-31T05:46:15.150000+00:00

DELETE FROM `TikTok_JF_AdsDailyReport` WHERE `Date` >= @p0
