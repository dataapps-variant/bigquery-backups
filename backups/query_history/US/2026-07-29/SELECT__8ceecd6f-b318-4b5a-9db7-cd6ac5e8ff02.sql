-- job_id: 8ceecd6f-b318-4b5a-9db7-cd6ac5e8ff02
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:57:25.083000+00:00
-- started: 2026-07-29T11:57:25.211000+00:00
-- ended: 2026-07-29T11:57:25.429000+00:00

SELECT Spend_Country_Code_AFID AS splt, REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), '') AS grp, BC AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date = @rdate AND CONCAT(REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), ''), '|', Spend_Country_Code_AFID) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
