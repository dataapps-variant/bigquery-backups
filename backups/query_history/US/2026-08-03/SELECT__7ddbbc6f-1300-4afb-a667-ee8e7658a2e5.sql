-- job_id: 7ddbbc6f-1300-4afb-a667-ee8e7658a2e5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:55:07.261000+00:00
-- started: 2026-08-03T12:55:07.356000+00:00
-- ended: 2026-08-03T12:55:07.599000+00:00

SELECT a, p, c FROM (SELECT a, p, c, cs, SUM(cs) OVER (PARTITION BY a, p) AS pt, SUM(cs) OVER (PARTITION BY a, c) AS ct FROM (SELECT `App_Name` AS a, `Plan_Name` AS p, `Spend_Country_Code_AFID` AS c, SUM(`Subscriptions`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL AND `Plan_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Reporting_Date` = (SELECT MAX(`Reporting_Date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular') GROUP BY a, p, c)) ORDER BY a, pt DESC, p, ct DESC, cs DESC
