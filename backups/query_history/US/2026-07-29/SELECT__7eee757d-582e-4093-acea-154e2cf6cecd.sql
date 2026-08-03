-- job_id: 7eee757d-582e-4093-acea-154e2cf6cecd
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:27:00.314000+00:00
-- started: 2026-07-29T17:27:00.451000+00:00
-- ended: 2026-07-29T17:27:00.603000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
