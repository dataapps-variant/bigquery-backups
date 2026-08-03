-- job_id: job_x-ghkCkduK4YygAv3lrqUB51Wr4k
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:09.875000+00:00
-- started: 2026-07-31T05:46:10.185000+00:00
-- ended: 2026-07-31T05:46:11.190000+00:00

DELETE FROM `MS_Ads_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
