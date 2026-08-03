-- job_id: 46ae413f-78b8-4d9f-b573-526d6236b0d9
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:37:04.906000+00:00
-- started: 2026-07-29T17:37:05.034000+00:00
-- ended: 2026-07-29T17:37:05.152000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
