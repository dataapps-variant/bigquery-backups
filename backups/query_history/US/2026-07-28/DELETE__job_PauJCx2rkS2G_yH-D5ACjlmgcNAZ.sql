-- job_id: job_PauJCx2rkS2G_yH-D5ACjlmgcNAZ
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:12.199000+00:00
-- started: 2026-07-28T05:46:12.513000+00:00
-- ended: 2026-07-28T05:46:15.851000+00:00

DELETE FROM `Facebook_Ads_CT_DailyAdInsights` WHERE `DateStart` >= @p0
