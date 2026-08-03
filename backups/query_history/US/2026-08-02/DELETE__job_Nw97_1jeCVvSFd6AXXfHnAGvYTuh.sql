-- job_id: job_Nw97_1jeCVvSFd6AXXfHnAGvYTuh
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:47:33.307000+00:00
-- started: 2026-08-02T05:47:33.668000+00:00
-- ended: 2026-08-02T05:47:34.595000+00:00

DELETE FROM `Facebook_Ads_JF_DailyAdInsights` WHERE `DateStart` >= @p0
