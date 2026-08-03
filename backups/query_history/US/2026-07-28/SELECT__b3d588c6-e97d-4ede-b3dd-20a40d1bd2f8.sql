-- job_id: b3d588c6-e97d-4ede-b3dd-20a40d1bd2f8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:24:11.168000+00:00
-- started: 2026-07-28T11:24:11.300000+00:00
-- ended: 2026-07-28T11:24:11.503000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
