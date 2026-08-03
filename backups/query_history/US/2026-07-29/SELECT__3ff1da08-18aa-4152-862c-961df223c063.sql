-- job_id: 3ff1da08-18aa-4152-862c-961df223c063
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:01:53.785000+00:00
-- started: 2026-07-29T12:01:53.858000+00:00
-- ended: 2026-07-29T12:01:54.105000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `BC` AS xval, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` = @rdate AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
