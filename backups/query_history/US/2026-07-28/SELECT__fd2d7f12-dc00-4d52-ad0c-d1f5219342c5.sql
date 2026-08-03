-- job_id: fd2d7f12-dc00-4d52-ad0c-d1f5219342c5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:29:10.151000+00:00
-- started: 2026-07-28T11:29:10.283000+00:00
-- ended: 2026-07-28T11:29:11.205000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `App_Name` AS grp, `BC` AS xval, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` = @rdate AND CONCAT(`App_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
