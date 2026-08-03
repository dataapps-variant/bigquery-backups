-- job_id: job_zjHp2lsMQ9T5GRPhNBnGevTllCSX
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:15.320000+00:00
-- started: 2026-07-28T05:46:15.932000+00:00
-- ended: 2026-07-28T05:46:16.888000+00:00

DELETE FROM `TikTok_CT_AdsDailyReport` WHERE `Date` >= @p0
