-- job_id: 7a9e4e93-9154-4ce0-b00f-99108ab82ace
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:49:31.158000+00:00
-- started: 2026-07-29T11:49:31.251000+00:00
-- ended: 2026-07-29T11:49:31.553000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Plan_Name` AS grp, `Reporting_Date` AS xval, SUM(`Subscriptions`) AS `Subscription_users` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = @cohort_f AND `Table` = @ttype_f AND `Reporting_Date` >= @sd AND `Reporting_Date` <= @ed AND `BC` = @bc AND CONCAT(`Plan_Name`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
