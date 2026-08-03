-- job_id: 33ae8f9c-2823-4842-92a3-512bd6e8abb4
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:29:12.732000+00:00
-- started: 2026-07-28T11:29:12.805000+00:00
-- ended: 2026-07-28T11:29:13.189000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, BC AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date = @rdate AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
