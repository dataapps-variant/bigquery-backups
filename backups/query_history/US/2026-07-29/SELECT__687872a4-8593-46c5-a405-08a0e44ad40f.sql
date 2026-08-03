-- job_id: 687872a4-8593-46c5-a405-08a0e44ad40f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:50:04.529000+00:00
-- started: 2026-07-29T11:50:04.644000+00:00
-- ended: 2026-07-29T11:50:04.912000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `Reporting_Date` AS xval, SUM(`Subscriptions`) AS `Subscription_users`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Refund_Rate`) AS `Refund_ratio`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
