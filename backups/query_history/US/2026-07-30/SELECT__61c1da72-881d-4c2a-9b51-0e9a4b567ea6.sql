-- job_id: 61c1da72-881d-4c2a-9b51-0e9a4b567ea6
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:14:47.065000+00:00
-- started: 2026-07-30T12:14:47.313000+00:00
-- ended: 2026-07-30T12:14:47.688000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `Reporting_Date` AS xval, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Daily_New_Users`) AS `Recent_Users`, SUM(`Single_Sale`) AS `SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
