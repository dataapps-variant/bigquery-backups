-- job_id: 2f47be34-f058-47e4-bf9a-812dc0a927bb
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:22:03.376000+00:00
-- started: 2026-07-28T11:22:03.465000+00:00
-- ended: 2026-07-28T11:22:03.651000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Product_Name_Final` AS grp, `Report_date` AS xval, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Recent_Users`) AS `Recent_Users`, SUM(`SS_Users`) AS `SS_Users`, SUM(`T7D_Users`) AS `T7D_Users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Report_date` >= @sd AND `Report_date` <= @ed AND `Billing_Cycle` = @bc AND CONCAT(`Product_Name_Final`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
