-- job_id: c4d7d68c-526b-438d-9bc6-e16437b5ef3f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:24:35.242000+00:00
-- started: 2026-07-28T11:24:35.304000+00:00
-- ended: 2026-07-28T11:24:35.513000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(`Daily_Allocated_Spend`) AS `Daily_Spend`, SUM(`Daily_CAC`) AS `Daily_CAC` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND BC = 0 AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
