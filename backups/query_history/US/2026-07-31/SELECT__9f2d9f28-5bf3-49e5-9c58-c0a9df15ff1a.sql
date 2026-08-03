-- job_id: 9f2d9f28-5bf3-49e5-9c58-c0a9df15ff1a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:16:59.025000+00:00
-- started: 2026-07-31T13:16:59.096000+00:00
-- ended: 2026-07-31T13:16:59.199000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
