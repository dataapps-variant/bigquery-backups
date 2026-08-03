-- job_id: ae5a2dd4-af91-4cd6-a371-c3beb29a52ac
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:59:15.368000+00:00
-- started: 2026-07-29T11:59:15.458000+00:00
-- ended: 2026-07-29T11:59:15.572000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, BC AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date = @rdate AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
