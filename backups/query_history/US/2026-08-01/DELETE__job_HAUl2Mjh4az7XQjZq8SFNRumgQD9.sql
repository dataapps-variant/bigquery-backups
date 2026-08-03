-- job_id: job_HAUl2Mjh4az7XQjZq8SFNRumgQD9
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T05:47:32.324000+00:00
-- started: 2026-08-01T05:47:32.801000+00:00
-- ended: 2026-08-01T05:47:33.717000+00:00

DELETE FROM `Facebook_Ads_JF_DailyAdInsights` WHERE `DateStart` >= @p0
