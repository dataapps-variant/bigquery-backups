-- job_id: job_43On8UDKjEsoFTlAp1mtj6hEnB9n
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:05.129000+00:00
-- started: 2026-08-02T05:46:05.431000+00:00
-- ended: 2026-08-02T05:46:06.318000+00:00

DELETE FROM `MS_Ads_PD_CampaignPerformanceDailyReport` WHERE `Date` >= @p0
