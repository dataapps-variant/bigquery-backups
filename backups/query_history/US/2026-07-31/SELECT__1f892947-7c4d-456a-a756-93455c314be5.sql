-- job_id: 1f892947-7c4d-456a-a756-93455c314be5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:00:14.999000+00:00
-- started: 2026-07-31T11:00:15.098000+00:00
-- ended: 2026-07-31T11:00:15.316000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, BC AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date = @rdate AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
