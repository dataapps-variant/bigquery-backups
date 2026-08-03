-- job_id: 3a77f7e7-a80b-49b2-8b21-0069ffddb3a2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:22:57.403000+00:00
-- started: 2026-07-28T11:22:57.486000+00:00
-- ended: 2026-07-28T11:22:57.691000+00:00

SELECT Spend_Country_Code_AFID AS splt, REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), '') AS grp, BC AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date = @rdate AND CONCAT(REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), ''), '|', Spend_Country_Code_AFID) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
