-- job_id: 0329b039-d05d-445b-8738-d49ff422e0d1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:12:52.422000+00:00
-- started: 2026-07-29T11:12:52.493000+00:00
-- ended: 2026-07-29T11:12:52.701000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Product_Name_Final` AS grp, `Report_date` AS xval, SUM(`Churn_rate`) AS `Churn_rate`, SUM(`NET_Retention_rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Retention_rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball` WHERE `Report_date` >= @sd AND `Report_date` <= @ed AND `Billing_Cycle` = @bc AND CONCAT(`Product_Name_Final`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
