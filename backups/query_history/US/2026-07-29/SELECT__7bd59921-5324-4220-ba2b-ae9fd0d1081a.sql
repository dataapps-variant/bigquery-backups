-- job_id: 7bd59921-5324-4220-ba2b-ae9fd0d1081a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:12:54.757000+00:00
-- started: 2026-07-29T11:12:54.861000+00:00
-- ended: 2026-07-29T11:12:55.205000+00:00

SELECT Spend_Country_Code_AFID AS splt, REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), '') AS grp, Reporting_Date AS xval, SUM(`Daily_Spend`) AS `Daily_Spend`, SUM(`Daily_CAC`) AS `Daily_CAC`, SUM(`Daily_New_Users`) AS `Daily_New_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort = @cohort AND `Table` = @ttype AND BC = 0 AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND CONCAT(REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), ''), '|', Spend_Country_Code_AFID) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
