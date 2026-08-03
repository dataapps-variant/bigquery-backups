-- job_id: 0bfd9422-0b7f-42f8-80f0-e1e1c597dbf0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:06:42.770000+00:00
-- started: 2026-07-29T12:06:42.900000+00:00
-- ended: 2026-07-29T12:06:43.009000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
