-- job_id: 06bb4b6a-52a8-492b-b6c0-7aef2186955c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:16:56.133000+00:00
-- started: 2026-07-30T12:16:56.282000+00:00
-- ended: 2026-07-30T12:16:56.587000+00:00

SELECT Spend_Country_Code_AFID AS splt, REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), '') AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), ''), '|', Spend_Country_Code_AFID) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
