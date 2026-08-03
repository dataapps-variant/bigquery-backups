-- job_id: 4f000cd0-90da-4fd6-af72-77e61e2bc79f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:00:56.020000+00:00
-- started: 2026-07-30T13:00:56.125000+00:00
-- ended: 2026-07-30T13:00:56.237000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
