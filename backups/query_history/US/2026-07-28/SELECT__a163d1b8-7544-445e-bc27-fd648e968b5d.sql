-- job_id: a163d1b8-7544-445e-bc27-fd648e968b5d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:25:21.432000+00:00
-- started: 2026-07-28T11:25:21.544000+00:00
-- ended: 2026-07-28T11:25:22.018000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
