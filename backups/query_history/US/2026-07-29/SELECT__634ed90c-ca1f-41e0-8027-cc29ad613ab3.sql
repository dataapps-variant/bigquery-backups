-- job_id: 634ed90c-ca1f-41e0-8027-cc29ad613ab3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:15:11.037000+00:00
-- started: 2026-07-29T11:15:11.215000+00:00
-- ended: 2026-07-29T11:15:11.406000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
