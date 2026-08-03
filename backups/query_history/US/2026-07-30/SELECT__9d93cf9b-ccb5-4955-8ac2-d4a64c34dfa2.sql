-- job_id: 9d93cf9b-ccb5-4955-8ac2-d4a64c34dfa2
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:48.054000+00:00
-- started: 2026-07-30T14:50:48.181000+00:00
-- ended: 2026-07-30T14:50:48.456000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
