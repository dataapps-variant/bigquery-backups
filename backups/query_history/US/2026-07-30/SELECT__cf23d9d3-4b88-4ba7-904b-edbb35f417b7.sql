-- job_id: cf23d9d3-4b88-4ba7-904b-edbb35f417b7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:56:04.900000+00:00
-- started: 2026-07-30T12:56:05.008000+00:00
-- ended: 2026-07-30T12:56:05.215000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `Reporting_Date` AS xval, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Refund_Rate`) AS `Refund_ratio`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate`, SUM(`Subscriptions`) AS `Subscription_users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
