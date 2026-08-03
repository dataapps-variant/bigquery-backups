-- job_id: 55d6e113-e4ee-4fcd-9b2f-ffc08326d04c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:48.041000+00:00
-- started: 2026-07-30T14:50:48.160000+00:00
-- ended: 2026-07-30T14:50:48.268000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
