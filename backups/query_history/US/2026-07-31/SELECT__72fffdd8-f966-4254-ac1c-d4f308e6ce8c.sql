-- job_id: 72fffdd8-f966-4254-ac1c-d4f308e6ce8c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:29:58.522000+00:00
-- started: 2026-07-31T12:29:58.633000+00:00
-- ended: 2026-07-31T12:29:58.846000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
