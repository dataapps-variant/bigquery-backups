-- job_id: job_vysgJzP8QmJwqJtczdMJva7DdrbD
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:45:58.036000+00:00
-- started: 2026-08-01T05:45:58.407000+00:00
-- ended: 2026-08-01T05:45:59.254000+00:00

DELETE FROM `MS_Ads_AT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
