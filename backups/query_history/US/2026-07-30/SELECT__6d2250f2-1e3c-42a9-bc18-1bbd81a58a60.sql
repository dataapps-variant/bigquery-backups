-- job_id: 6d2250f2-1e3c-42a9-bc18-1bbd81a58a60
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:03:49.953000+00:00
-- started: 2026-07-30T13:03:50.074000+00:00
-- ended: 2026-07-30T13:03:50.213000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
