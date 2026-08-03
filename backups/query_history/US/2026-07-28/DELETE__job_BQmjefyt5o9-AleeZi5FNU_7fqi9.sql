-- job_id: job_BQmjefyt5o9-AleeZi5FNU_7fqi9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:08.316000+00:00
-- started: 2026-07-28T05:46:08.721000+00:00
-- ended: 2026-07-28T05:46:09.915000+00:00

DELETE FROM `MS_Ads_EN_AdPerformanceDailyReport` WHERE `Date` >= @p0
