-- job_id: job_57VqrDY4tbkpgbRqvKHDT2sY-Old
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:02.737000+00:00
-- started: 2026-07-29T05:46:03.378000+00:00
-- ended: 2026-07-29T05:46:04.374000+00:00

DELETE FROM `MS_Ads_EN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
