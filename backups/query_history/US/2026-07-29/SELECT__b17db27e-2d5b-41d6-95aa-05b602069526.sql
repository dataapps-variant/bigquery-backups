-- job_id: b17db27e-2d5b-41d6-95aa-05b602069526
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:12:49.623000+00:00
-- started: 2026-07-29T11:12:49.708000+00:00
-- ended: 2026-07-29T11:12:49.911000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Product_Name_Final` AS grp, `Report_date` AS xval, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Recent_Users`) AS `Recent_Users`, SUM(`SS_Users`) AS `SS_Users`, SUM(`T7D_Users`) AS `T7D_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Report_date` >= @sd AND `Report_date` <= @ed AND `Billing_Cycle` = @bc AND CONCAT(`Product_Name_Final`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
