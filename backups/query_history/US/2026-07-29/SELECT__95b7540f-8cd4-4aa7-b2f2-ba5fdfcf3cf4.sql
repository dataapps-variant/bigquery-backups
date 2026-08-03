-- job_id: 95b7540f-8cd4-4aa7-b2f2-ba5fdfcf3cf4
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:06:23.359000+00:00
-- started: 2026-07-29T12:06:23.449000+00:00
-- ended: 2026-07-29T12:06:23.583000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscriptions`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Reporting_Date` = (SELECT MAX(`Reporting_Date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular') GROUP BY a, c) ORDER BY a, cs DESC, c
