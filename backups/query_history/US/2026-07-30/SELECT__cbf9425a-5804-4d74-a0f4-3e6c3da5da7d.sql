-- job_id: cbf9425a-5804-4d74-a0f4-3e6c3da5da7d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:12:03.002000+00:00
-- started: 2026-07-30T12:12:03.134000+00:00
-- ended: 2026-07-30T12:12:03.359000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `Reporting_Date` AS xval, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Daily_New_Users`) AS `Recent_Users`, SUM(`Single_Sale`) AS `SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
