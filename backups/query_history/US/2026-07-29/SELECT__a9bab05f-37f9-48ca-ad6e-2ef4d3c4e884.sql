-- job_id: a9bab05f-37f9-48ca-ad6e-2ef4d3c4e884
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:06:32.846000+00:00
-- started: 2026-07-29T12:06:32.948000+00:00
-- ended: 2026-07-29T12:06:33.047000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
