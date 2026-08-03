-- job_id: b6f22f2c-3793-4e2c-a5ce-edd467b92003
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:49:09.412000+00:00
-- started: 2026-07-30T12:49:09.534000+00:00
-- ended: 2026-07-30T12:49:09.737000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
