-- job_id: 9f2ca0a6-c562-4bd2-9193-6d837fde1071
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:00:39.110000+00:00
-- started: 2026-07-30T13:00:39.203000+00:00
-- ended: 2026-07-30T13:00:39.336000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscriptions`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Reporting_Date` = (SELECT MAX(`Reporting_Date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular') GROUP BY a, c) ORDER BY a, cs DESC, c
