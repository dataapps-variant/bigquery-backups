-- job_id: job_zaeDUj0pc28wkCQIad0RwSBTIiNI
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:02.488000+00:00
-- started: 2026-07-30T05:46:02.884000+00:00
-- ended: 2026-07-30T05:46:03.782000+00:00

DELETE FROM `MS_Ads_CN_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
