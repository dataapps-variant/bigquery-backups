-- job_id: 5215c70e-a20b-4e15-b496-9213f35abb7e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:53:09.979000+00:00
-- started: 2026-07-29T17:53:10.090000+00:00
-- ended: 2026-07-29T17:53:10.301000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
