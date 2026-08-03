-- job_id: 67f7544a-5a42-46a5-820a-91c11e85bbf1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:49:11.499000+00:00
-- started: 2026-07-30T12:49:11.607000+00:00
-- ended: 2026-07-30T12:49:11.809000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
