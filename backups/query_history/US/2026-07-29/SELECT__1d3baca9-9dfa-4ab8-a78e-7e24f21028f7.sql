-- job_id: 1d3baca9-9dfa-4ab8-a78e-7e24f21028f7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:15:30.017000+00:00
-- started: 2026-07-29T11:15:30.119000+00:00
-- ended: 2026-07-29T11:15:30.318000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `App_Name` AS grp, `BC` AS xval, SUM(`Churn_Rate`) AS `Churn_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Rebills`) AS `Rebill_users`, SUM(`Recent_CAC`) AS `Recent_CAC`, SUM(`Refund_Rate`) AS `Refund_ratio`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` = @rdate AND CONCAT(`App_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
