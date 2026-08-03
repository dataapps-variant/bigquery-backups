-- job_id: 4fb7abb7-3265-4340-b269-b7d23fd0b455
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:01:52.054000+00:00
-- started: 2026-07-29T12:01:52.170000+00:00
-- ended: 2026-07-29T12:01:52.374000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `BC` AS xval, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Gross_ARPU_Retention_Rate`) AS `Retention_rate`, SUM(`Net_ARPU_Retention_Rate`) AS `NET_Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` = @rdate AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
