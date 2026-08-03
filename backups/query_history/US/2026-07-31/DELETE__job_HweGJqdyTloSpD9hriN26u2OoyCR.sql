-- job_id: job_HweGJqdyTloSpD9hriN26u2OoyCR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:03.662000+00:00
-- started: 2026-07-31T05:46:03.988000+00:00
-- ended: 2026-07-31T05:46:05.304000+00:00

DELETE FROM `MS_Ads_PD_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
