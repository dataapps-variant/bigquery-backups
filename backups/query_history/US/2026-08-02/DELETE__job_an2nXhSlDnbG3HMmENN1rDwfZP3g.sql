-- job_id: job_an2nXhSlDnbG3HMmENN1rDwfZP3g
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:08.187000+00:00
-- started: 2026-08-02T05:46:08.471000+00:00
-- ended: 2026-08-02T05:46:09.476000+00:00

DELETE FROM `TikTok_JF_AdsDailyReport` WHERE `Date` >= @p0
