-- job_id: 42b45a2c-8dd5-48c6-b1d6-98007a69ec52
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:42.617000+00:00
-- started: 2026-07-29T11:45:42.854000+00:00
-- ended: 2026-07-29T11:45:43.019000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscriptions`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Reporting_Date` = (SELECT MAX(`Reporting_Date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular') GROUP BY a, c) ORDER BY a, cs DESC, c
