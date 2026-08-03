-- job_id: 2a8ca67d-1e56-4395-aab6-6b1316865865
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:00:35.595000+00:00
-- started: 2026-07-31T13:00:36.118000+00:00
-- ended: 2026-07-31T13:00:36.274000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
