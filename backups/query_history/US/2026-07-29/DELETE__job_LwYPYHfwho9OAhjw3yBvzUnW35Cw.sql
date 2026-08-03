-- job_id: job_LwYPYHfwho9OAhjw3yBvzUnW35Cw
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:02.838000+00:00
-- started: 2026-07-29T05:46:03.133000+00:00
-- ended: 2026-07-29T05:46:19.746000+00:00

DELETE FROM `MS_Ads_EN_AdPerformanceDailyReport` WHERE `Date` >= @p0
