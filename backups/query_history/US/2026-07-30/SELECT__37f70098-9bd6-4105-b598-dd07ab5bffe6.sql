-- job_id: 37f70098-9bd6-4105-b598-dd07ab5bffe6
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:05:39.051000+00:00
-- started: 2026-07-30T12:05:39.174000+00:00
-- ended: 2026-07-30T12:05:39.391000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `BC` AS xval, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Refund_Rate`) AS `Refund_ratio`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` = @rdate AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
