-- job_id: job_4WSsIi_hwIXcyAV0KjRPjDdMW26g
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:04.791000+00:00
-- started: 2026-07-30T05:46:05.103000+00:00
-- ended: 2026-07-30T05:46:06.588000+00:00

DELETE FROM `TikTok_CT_AdsDailyReport` WHERE `Date` >= @p0
