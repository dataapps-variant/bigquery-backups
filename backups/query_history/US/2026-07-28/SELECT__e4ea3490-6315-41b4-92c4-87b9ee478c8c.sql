-- job_id: e4ea3490-6315-41b4-92c4-87b9ee478c8c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T16:49:57.761000+00:00
-- started: 2026-07-28T16:49:57.862000+00:00
-- ended: 2026-07-28T16:49:58.042000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
