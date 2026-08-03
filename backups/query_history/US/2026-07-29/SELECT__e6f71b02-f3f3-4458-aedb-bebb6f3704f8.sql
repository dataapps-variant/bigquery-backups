-- job_id: e6f71b02-f3f3-4458-aedb-bebb6f3704f8
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:44:22.074000+00:00
-- started: 2026-07-29T08:44:22.240000+00:00
-- ended: 2026-07-29T08:44:22.466000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
