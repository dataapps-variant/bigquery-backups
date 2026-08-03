-- job_id: 606ceaa3-c8e9-4a51-ac84-ac98ffc7eee8
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:45:55.045000+00:00
-- started: 2026-07-30T13:45:55.262000+00:00
-- ended: 2026-07-30T13:45:55.399000+00:00

SELECT a, c FROM (SELECT `App_Name` AS a, `Spend_Country_Code_AFID` AS c, SUM(`Subscriptions`) AS cs FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL AND `Spend_Country_Code_AFID` IS NOT NULL AND `Reporting_Date` = (SELECT MAX(`Reporting_Date`) FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular') GROUP BY a, c) ORDER BY a, cs DESC, c
