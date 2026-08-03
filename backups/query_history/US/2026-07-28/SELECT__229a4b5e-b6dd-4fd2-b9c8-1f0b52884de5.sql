-- job_id: 229a4b5e-b6dd-4fd2-b9c8-1f0b52884de5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:03:47.144000+00:00
-- started: 2026-07-28T13:03:47.239000+00:00
-- ended: 2026-07-28T13:03:47.468000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Product_Name_Final` AS grp, `Report_date` AS xval, SUM(`Churn_rate`) AS `Churn_rate`, SUM(`NET_Retention_rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Retention_rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball` WHERE `Report_date` >= @sd AND `Report_date` <= @ed AND `Billing_Cycle` = @bc AND CONCAT(`Product_Name_Final`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
