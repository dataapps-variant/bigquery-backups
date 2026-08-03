-- job_id: df20e898-770a-401f-9bfb-4195306bb8af
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:15:02.439000+00:00
-- started: 2026-07-29T11:15:02.566000+00:00
-- ended: 2026-07-29T11:15:02.828000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
