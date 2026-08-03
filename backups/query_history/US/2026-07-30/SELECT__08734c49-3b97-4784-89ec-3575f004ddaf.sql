-- job_id: 08734c49-3b97-4784-89ec-3575f004ddaf
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:07:38.510000+00:00
-- started: 2026-07-30T12:07:38.597000+00:00
-- ended: 2026-07-30T12:07:38.946000+00:00

SELECT Spend_Country_Code_AFID AS splt, REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), '') AS grp, Reporting_Date AS xval, SUM(`Daily_Spend`) AS `Daily_Spend`, SUM(`Daily_CAC`) AS `Daily_CAC`, SUM(`T7D_New_Users`) AS `T7D_New_Users`, SUM(`T7D_Daily_SS_Users`) AS `T7D_Daily_SS_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE Cohort = @cohort AND `Table` = @ttype AND BC = 0 AND Reporting_Date >= @sd AND Reporting_Date <= @ed AND CONCAT(REGEXP_REPLACE(Product_SCA, CONCAT('_', Spend_Country_Code_AFID, '$'), ''), '|', Spend_Country_Code_AFID) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
