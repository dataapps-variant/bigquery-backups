-- job_id: job_4vIZmlTZIeyrBsfLEDRsRBwr9LYN
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:10.580000+00:00
-- started: 2026-07-31T05:46:10.889000+00:00
-- ended: 2026-07-31T05:46:11.863000+00:00

DELETE FROM `MS_Ads_JF_AdPerformanceDailyReport` WHERE `Date` >= @p0
