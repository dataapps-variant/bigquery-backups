-- job_id: 99c2d54b-917d-4dc3-a2a6-bcc1d490e8cc
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:49:29.758000+00:00
-- started: 2026-07-30T13:49:29.859000+00:00
-- ended: 2026-07-30T13:49:30.054000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `App_Name` AS grp, `Reporting_Date` AS xval, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Daily_New_Users`) AS `Recent_Users`, SUM(`Daily_SS_Users`) AS `SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`App_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
