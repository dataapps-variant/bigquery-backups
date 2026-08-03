-- job_id: ca1d98db-dd54-40ff-803a-e4b3d2d0dd75
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:05:08.679000+00:00
-- started: 2026-07-29T12:05:08.852000+00:00
-- ended: 2026-07-29T12:05:09.050000+00:00

SELECT Spend_Country_Code_AFID AS splt, REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), '') AS grp, Reporting_Date AS xval, SUM(Cumulative_Refund_Rate) AS val FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort = @cohort AND `Table` = @ttype AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND BC = @bc AND CONCAT(REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), ''), '|', Spend_Country_Code_AFID) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
