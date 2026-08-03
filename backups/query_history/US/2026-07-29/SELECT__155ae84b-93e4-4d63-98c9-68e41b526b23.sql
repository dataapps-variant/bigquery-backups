-- job_id: 155ae84b-93e4-4d63-98c9-68e41b526b23
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:15:31.555000+00:00
-- started: 2026-07-29T11:15:31.645000+00:00
-- ended: 2026-07-29T11:15:31.847000+00:00

SELECT Spend_Country_Code_AFID AS splt, App_Name AS grp, BC AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date = @rdate AND CONCAT(App_Name, '|', Spend_Country_Code_AFID) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
