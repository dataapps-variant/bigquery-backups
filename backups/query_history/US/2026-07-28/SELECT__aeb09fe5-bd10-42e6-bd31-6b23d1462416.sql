-- job_id: aeb09fe5-bd10-42e6-bd31-6b23d1462416
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:23:34.093000+00:00
-- started: 2026-07-28T11:23:34.162000+00:00
-- ended: 2026-07-28T11:23:34.669000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Product_Name_Final` AS grp, `Report_date` AS xval, SUM(`Churn_rate`) AS `Churn_rate`, SUM(`NET_Retention_rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Rebill_users`) AS `Rebill_users`, SUM(`Refund_ratio`) AS `Refund_ratio`, SUM(`Retention_rate`) AS `Retention_rate`, SUM(`Subscription_users`) AS `Subscription_users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Report_date` >= @sd AND `Report_date` <= @ed AND `Billing_Cycle` = @bc AND CONCAT(`Product_Name_Final`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
