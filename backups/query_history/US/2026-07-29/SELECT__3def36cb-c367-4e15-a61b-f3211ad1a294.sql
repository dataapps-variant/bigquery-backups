-- job_id: 3def36cb-c367-4e15-a61b-f3211ad1a294
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:46.910000+00:00
-- started: 2026-07-29T11:45:46.984000+00:00
-- ended: 2026-07-29T11:45:47.196000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `App_Name` AS grp, `Reporting_Date` AS xval, SUM(`Subscriptions`) AS `Subscription_users`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Churn_Rate`) AS `Churn_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`App_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
