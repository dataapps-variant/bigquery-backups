-- job_id: ce5c9840-1f60-4df9-8fa4-d5b98ed24f8c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T10:14:05.553000+00:00
-- started: 2026-07-30T10:14:05.649000+00:00
-- ended: 2026-07-30T10:14:05.873000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(`Daily_Allocated_Spend`) AS `Daily_Spend`, SUM(`Daily_CAC`) AS `Daily_CAC`, SUM(`T7D_New_Users`) AS `T7D_New_Users`, SUM(`T7D_Daily_SS_Users`) AS `T7D_Daily_SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND BC = 0 AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
