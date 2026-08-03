-- job_id: job_GI5hvmEEOyevc29WphatCHEJH99Q
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:12.613000+00:00
-- started: 2026-07-30T05:46:12.900000+00:00
-- ended: 2026-07-30T05:46:13.830000+00:00

DELETE FROM `MS_Ads_EN_AdPerformanceDailyReport` WHERE `Date` >= @p0
