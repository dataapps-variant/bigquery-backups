-- job_id: 7de6d49b-3bcd-418d-bee6-86f41978db4b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T09:52:15.144000+00:00
-- started: 2026-07-29T09:52:15.221000+00:00
-- ended: 2026-07-29T09:52:15.400000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `App_Name` AS grp, `Reporting_Date` AS xval, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`App_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
