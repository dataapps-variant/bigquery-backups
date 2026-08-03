-- job_id: job_H1kUrQOc27udqsKc2hlPdxrWUTNr
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:47:34.197000+00:00
-- started: 2026-07-28T05:47:34.522000+00:00
-- ended: 2026-07-28T05:47:35.691000+00:00

DELETE FROM `Facebook_Ads_JF_DailyAdInsights` WHERE `DateStart` >= @p0
