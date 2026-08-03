-- job_id: e15d9651-5fb7-4920-acc7-8b3a266b0f87
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:44:57.098000+00:00
-- started: 2026-07-31T13:44:57.543000+00:00
-- ended: 2026-07-31T13:44:57.661000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
