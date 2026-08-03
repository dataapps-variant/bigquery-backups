-- job_id: job_R8_CxPW7gVz8uovLif-C7wqwCJxK
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:03.839000+00:00
-- started: 2026-07-30T05:46:04.325000+00:00
-- ended: 2026-07-30T05:46:06.362000+00:00

DELETE FROM `MS_Ads_CT_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
