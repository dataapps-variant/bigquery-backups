-- job_id: c3c77b28-85b0-430f-804c-9a5d7fd81b05
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:33:09.622000+00:00
-- started: 2026-07-29T11:33:09.720000+00:00
-- ended: 2026-07-29T11:33:09.983000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `Reporting_Date` AS xval, SUM(`Subscriptions`) AS `Subscription_users`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Refund_Rate`) AS `Refund_ratio`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
