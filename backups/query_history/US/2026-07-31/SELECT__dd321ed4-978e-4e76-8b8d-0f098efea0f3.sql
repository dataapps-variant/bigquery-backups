-- job_id: dd321ed4-978e-4e76-8b8d-0f098efea0f3
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:57:54.008000+00:00
-- started: 2026-07-31T10:57:54.122000+00:00
-- ended: 2026-07-31T10:57:54.383000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `App_Name` AS grp, `Reporting_Date` AS xval, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Refund_Rate`) AS `Refund_ratio`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate`, SUM(`Subscriptions`) AS `Subscription_users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`App_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
