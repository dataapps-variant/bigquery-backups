-- job_id: 9983a4f9-f7a4-4e11-a2de-aed43f4df0f9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T19:36:49.983000+00:00
-- started: 2026-07-29T19:36:50.081000+00:00
-- ended: 2026-07-29T19:36:50.171000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
