-- job_id: job_PpRrIBA-YtY4sIxu77-zpBoQohuq
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:00.745000+00:00
-- started: 2026-07-28T05:46:01.120000+00:00
-- ended: 2026-07-28T05:46:02.324000+00:00

DELETE FROM `MS_Ads_AT_AdPerformanceDailyReport` WHERE `Date` >= @p0
