-- job_id: e7e7c889-ac23-4e39-aeb8-248931f17d7d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:39:02.526000+00:00
-- started: 2026-07-28T10:39:02.614000+00:00
-- ended: 2026-07-28T10:39:02.804000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
