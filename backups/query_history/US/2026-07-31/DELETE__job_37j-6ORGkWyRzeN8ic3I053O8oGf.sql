-- job_id: job_37j-6ORGkWyRzeN8ic3I053O8oGf
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:07.493000+00:00
-- started: 2026-07-31T05:46:07.852000+00:00
-- ended: 2026-07-31T05:46:08.740000+00:00

DELETE FROM `MS_Ads_FS_GeographicPerformanceDailyReport` WHERE `Date` >= @p0
