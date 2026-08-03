-- job_id: job_MuKawZlo7lJHhuEHeALG8nfHcVJc
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:05.361000+00:00
-- started: 2026-07-29T05:46:05.685000+00:00
-- ended: 2026-07-29T05:46:06.603000+00:00

DELETE FROM `MS_Ads_PD_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
