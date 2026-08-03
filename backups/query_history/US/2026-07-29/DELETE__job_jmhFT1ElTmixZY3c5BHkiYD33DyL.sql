-- job_id: job_jmhFT1ElTmixZY3c5BHkiYD33DyL
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:12.005000+00:00
-- started: 2026-07-29T05:46:12.290000+00:00
-- ended: 2026-07-29T05:46:13.491000+00:00

DELETE FROM `MS_Ads_PD_AdPerformanceDailyReport` WHERE `Date` >= @p0
