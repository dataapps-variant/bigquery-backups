-- job_id: job_kU5fhm-BPJy3akYxdM1Z_c5DrIqp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:45:58.312000+00:00
-- started: 2026-08-02T05:45:58.690000+00:00
-- ended: 2026-08-02T05:45:59.835000+00:00

DELETE FROM `MS_Ads_CN_AdPerformanceDailyReport` WHERE `Date` >= @p0
