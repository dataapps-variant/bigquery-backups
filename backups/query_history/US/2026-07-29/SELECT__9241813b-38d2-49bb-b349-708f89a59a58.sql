-- job_id: 9241813b-38d2-49bb-b349-708f89a59a58
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:31:48.882000+00:00
-- started: 2026-07-29T14:31:48.984000+00:00
-- ended: 2026-07-29T14:31:49.197000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(`Daily_Allocated_Spend`) AS `Daily_Spend`, SUM(`Daily_CAC`) AS `Daily_CAC`, SUM(`T7D_New_Users`) AS `T7D_New_Users`, SUM(`T7D_Daily_SS_Users`) AS `T7D_Daily_SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND BC = 0 AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
