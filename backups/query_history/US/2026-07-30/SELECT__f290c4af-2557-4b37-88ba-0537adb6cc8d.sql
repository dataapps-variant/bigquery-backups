-- job_id: f290c4af-2557-4b37-88ba-0537adb6cc8d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:35:46.505000+00:00
-- started: 2026-07-30T13:35:46.634000+00:00
-- ended: 2026-07-30T13:35:46.733000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
