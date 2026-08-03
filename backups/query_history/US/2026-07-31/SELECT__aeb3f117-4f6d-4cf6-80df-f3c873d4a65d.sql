-- job_id: aeb3f117-4f6d-4cf6-80df-f3c873d4a65d
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:33:36.780000+00:00
-- started: 2026-07-31T10:33:36.842000+00:00
-- ended: 2026-07-31T10:33:37.013000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
