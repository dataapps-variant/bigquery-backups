-- job_id: 7473246b-537f-4818-b65c-d2c445d6643d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:24:39.090000+00:00
-- started: 2026-07-28T11:24:39.165000+00:00
-- ended: 2026-07-28T11:24:39.331000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
