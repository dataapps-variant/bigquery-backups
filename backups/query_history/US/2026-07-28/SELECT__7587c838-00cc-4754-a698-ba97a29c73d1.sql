-- job_id: 7587c838-00cc-4754-a698-ba97a29c73d1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:32:22.145000+00:00
-- started: 2026-07-28T11:32:22.275000+00:00
-- ended: 2026-07-28T11:32:22.456000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(`T7D_New_Users`) AS `T7D_New_Users`, SUM(`T7D_Daily_SS_Users`) AS `T7D_Daily_SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND BC = 0 AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
