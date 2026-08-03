-- job_id: 85898db3-8964-4c93-9d94-33b5a1628ed4
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:48:21.342000+00:00
-- started: 2026-07-31T12:48:21.415000+00:00
-- ended: 2026-07-31T12:48:21.536000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscriptions`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Reporting_Date` = (SELECT MAX(`Reporting_Date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular') GROUP BY a, c) ORDER BY a, cs DESC, c
