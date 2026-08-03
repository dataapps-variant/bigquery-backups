-- job_id: job_STKRQ8-czJZ-ghy9yY5psks1ph1S
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:06.902000+00:00
-- started: 2026-07-28T05:46:07.303000+00:00
-- ended: 2026-07-28T05:46:09.118000+00:00

DELETE FROM `MS_Ads_CT_AdPerformanceDailyReport` WHERE `Date` >= @p0
