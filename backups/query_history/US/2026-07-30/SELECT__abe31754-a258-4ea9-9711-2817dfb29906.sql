-- job_id: abe31754-a258-4ea9-9711-2817dfb29906
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:53:47.520000+00:00
-- started: 2026-07-30T09:53:47.613000+00:00
-- ended: 2026-07-30T09:53:47.766000+00:00

SELECT `App_Name` AS grp, `Report_Date` AS xval, SUM(`BC_New_Users`) AS v FROM `variant-finance-data-project.ICARUS_Multi.User_Count` WHERE `App_Name` IN UNNEST(@apps) AND `Report_Date` >= @sd AND `Report_Date` <= @ed AND `Billing_Cycle_Updated` = @bc GROUP BY grp, xval ORDER BY grp, xval
