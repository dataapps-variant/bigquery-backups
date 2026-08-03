-- job_id: job_HpoHWvHqea5iSpiRrY_64S2k2QK7
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:58.233000+00:00
-- started: 2026-08-02T05:45:58.594000+00:00
-- ended: 2026-08-02T05:45:59.408000+00:00

DELETE FROM `TikTok_DT_AdsDailyReport` WHERE `Date` >= @p0
