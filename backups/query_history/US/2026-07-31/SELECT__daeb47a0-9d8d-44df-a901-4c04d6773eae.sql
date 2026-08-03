-- job_id: daeb47a0-9d8d-44df-a901-4c04d6773eae
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:00:22.747000+00:00
-- started: 2026-07-31T14:00:22.862000+00:00
-- ended: 2026-07-31T14:00:22.991000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
