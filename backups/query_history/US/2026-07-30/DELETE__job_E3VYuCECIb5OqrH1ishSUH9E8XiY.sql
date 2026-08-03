-- job_id: job_E3VYuCECIb5OqrH1ishSUH9E8XiY
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:03.825000+00:00
-- started: 2026-07-30T05:46:04.160000+00:00
-- ended: 2026-07-30T05:46:05.144000+00:00

DELETE FROM `MS_Ads_CT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
