-- job_id: cd9eb472-30c4-477f-b21c-6965019137c5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:56:57.484000+00:00
-- started: 2026-07-29T11:56:57.608000+00:00
-- ended: 2026-07-29T11:56:57.791000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `BC` AS xval, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` = @rdate AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
