-- job_id: job_6W8CHJ4KgA3RurX5qdMPCtv-_VkF
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:06.304000+00:00
-- started: 2026-07-29T05:46:06.654000+00:00
-- ended: 2026-07-29T05:46:07.579000+00:00

DELETE FROM `MS_Ads_CT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
