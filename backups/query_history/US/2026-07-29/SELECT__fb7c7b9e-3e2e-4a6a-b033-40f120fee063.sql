-- job_id: fb7c7b9e-3e2e-4a6a-b033-40f120fee063
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:21:21.769000+00:00
-- started: 2026-07-29T13:21:21.877000+00:00
-- ended: 2026-07-29T13:21:22.162000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
