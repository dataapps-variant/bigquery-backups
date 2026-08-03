-- job_id: 483bc80b-781f-470d-9dae-6b2d78237115
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:51:33.309000+00:00
-- started: 2026-07-29T11:51:33.432000+00:00
-- ended: 2026-07-29T11:51:33.685000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `App_Name` AS grp, `Reporting_Date` AS xval, SUM(`Subscriptions`) AS `Subscription_users`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`App_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
