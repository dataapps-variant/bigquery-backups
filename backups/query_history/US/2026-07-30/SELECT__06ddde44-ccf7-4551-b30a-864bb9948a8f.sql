-- job_id: 06ddde44-ccf7-4551-b30a-864bb9948a8f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:45:53.933000+00:00
-- started: 2026-07-30T13:45:54.071000+00:00
-- ended: 2026-07-30T13:45:54.172000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
