-- job_id: job_B108luotiBglk9VJe4cVAb3Sb7Kw
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:02.144000+00:00
-- started: 2026-07-31T05:46:02.990000+00:00
-- ended: 2026-07-31T05:46:03.849000+00:00

DELETE FROM `MS_Ads_CT_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
