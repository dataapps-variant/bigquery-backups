-- job_id: job_bgpWjZTk4J5LwLhSxZ9IQX1va26Q
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:46:08.902000+00:00
-- started: 2026-08-01T05:46:09.207000+00:00
-- ended: 2026-08-01T05:46:20.250000+00:00

DELETE FROM `Facebook_Ads_CT_DailyAdInsights` WHERE `DateStart` >= @p0
