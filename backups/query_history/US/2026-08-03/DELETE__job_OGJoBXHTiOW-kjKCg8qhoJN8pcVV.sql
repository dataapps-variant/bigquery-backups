-- job_id: job_OGJoBXHTiOW-kjKCg8qhoJN8pcVV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:56.646000+00:00
-- started: 2026-08-03T05:45:56.987000+00:00
-- ended: 2026-08-03T05:45:57.913000+00:00

DELETE FROM `MS_Ads_AT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
