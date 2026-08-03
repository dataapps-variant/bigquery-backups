-- job_id: b14f3fd0-ee7e-4358-aedb-4671897b8aa2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:05:50.799000+00:00
-- started: 2026-07-29T12:05:50.907000+00:00
-- ended: 2026-07-29T12:05:51.124000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `BC` AS xval, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Refund_Rate`) AS `Refund_ratio`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` = @rdate AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
