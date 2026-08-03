-- job_id: job_vHEx14e8R660KOISWVeDf10nlhIp
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:45:59.400000+00:00
-- started: 2026-08-03T05:45:59.734000+00:00
-- ended: 2026-08-03T05:46:01.181000+00:00

DELETE FROM `Facebook_Ads_CT_DailyAdInsights` WHERE `DateStart` >= @p0
