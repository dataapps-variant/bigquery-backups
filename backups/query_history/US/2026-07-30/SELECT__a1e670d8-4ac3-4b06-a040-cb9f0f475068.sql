-- job_id: a1e670d8-4ac3-4b06-a040-cb9f0f475068
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:05:48.671000+00:00
-- started: 2026-07-30T13:05:48.779000+00:00
-- ended: 2026-07-30T13:05:48.907000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
