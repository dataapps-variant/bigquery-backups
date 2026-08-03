-- job_id: 8c529a03-dc5f-45c2-9588-ca6f824d7054
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:00:02.905000+00:00
-- started: 2026-07-30T13:00:03.013000+00:00
-- ended: 2026-07-30T13:00:03.202000+00:00

SELECT a, p, c FROM (SELECT a, p, c, cs, SUM(cs) OVER (PARTITION BY a, p) AS pt, SUM(cs) OVER (PARTITION BY a, c) AS ct FROM (SELECT `App_Name` AS a, `Plan_Name` AS p, `Spend_Country_Code_AFID` AS c, SUM(`Subscriptions`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL AND `Plan_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Reporting_Date` = (SELECT MAX(`Reporting_Date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular') GROUP BY a, p, c)) ORDER BY a, pt DESC, p, ct DESC, cs DESC
