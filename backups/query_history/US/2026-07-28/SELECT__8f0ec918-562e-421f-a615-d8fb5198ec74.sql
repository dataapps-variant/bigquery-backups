-- job_id: 8f0ec918-562e-421f-a615-d8fb5198ec74
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:05:07.230000+00:00
-- started: 2026-07-28T13:05:07.343000+00:00
-- ended: 2026-07-28T13:05:07.567000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
