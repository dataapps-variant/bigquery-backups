-- job_id: 7ba98c03-2f6b-4e78-8537-b5b31f85ee72
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:12:20.527000+00:00
-- started: 2026-07-29T11:12:20.652000+00:00
-- ended: 2026-07-29T11:12:21.176000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
