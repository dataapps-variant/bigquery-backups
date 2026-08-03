-- job_id: c0409bee-f384-4c38-b88a-f9c72e40920f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:24:08.041000+00:00
-- started: 2026-07-28T11:24:08.126000+00:00
-- ended: 2026-07-28T11:24:08.339000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(`Daily_Allocated_Spend`) AS `Daily_Spend`, SUM(`Daily_CAC`) AS `Daily_CAC` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND BC = 0 AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
