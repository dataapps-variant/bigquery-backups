-- job_id: job_H1AZBPRR4Um1UjN5OVdwHahmS_-v
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:13.207000+00:00
-- started: 2026-07-28T05:46:13.541000+00:00
-- ended: 2026-07-28T05:46:14.613000+00:00

DELETE FROM `MS_Ads_PD_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
