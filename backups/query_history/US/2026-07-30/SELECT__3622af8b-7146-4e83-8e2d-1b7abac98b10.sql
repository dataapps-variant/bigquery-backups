-- job_id: 3622af8b-7146-4e83-8e2d-1b7abac98b10
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:56:48.161000+00:00
-- started: 2026-07-30T12:56:48.270000+00:00
-- ended: 2026-07-30T12:56:48.390000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
