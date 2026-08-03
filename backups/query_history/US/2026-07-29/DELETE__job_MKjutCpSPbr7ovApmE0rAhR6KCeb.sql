-- job_id: job_MKjutCpSPbr7ovApmE0rAhR6KCeb
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:09.796000+00:00
-- started: 2026-07-29T05:46:10.149000+00:00
-- ended: 2026-07-29T05:46:11.043000+00:00

DELETE FROM `MS_Ads_FS_AdPerformanceDailyReport` WHERE `Date` >= @p0
