-- job_id: 84a605ab-67cc-4b6d-9207-ceb484534373
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:06:05.236000+00:00
-- started: 2026-07-30T13:06:05.335000+00:00
-- ended: 2026-07-30T13:06:06.066000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
