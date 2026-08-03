-- job_id: 62066d30-7ffa-4fe1-89b0-b3f12b672e62
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:05:06.158000+00:00
-- started: 2026-07-29T12:05:06.566000+00:00
-- ended: 2026-07-29T12:05:06.756000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `Reporting_Date` AS xval, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Daily_New_Users`) AS `Recent_Users`, SUM(`Single_Sale`) AS `SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
