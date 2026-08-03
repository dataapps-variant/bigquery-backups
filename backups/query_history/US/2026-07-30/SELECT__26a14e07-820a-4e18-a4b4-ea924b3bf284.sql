-- job_id: 26a14e07-820a-4e18-a4b4-ea924b3bf284
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T21:26:00.110000+00:00
-- started: 2026-07-30T21:26:00.243000+00:00
-- ended: 2026-07-30T21:26:00.359000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
