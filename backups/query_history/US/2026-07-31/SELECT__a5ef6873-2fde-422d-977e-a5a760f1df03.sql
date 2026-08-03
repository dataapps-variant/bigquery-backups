-- job_id: a5ef6873-2fde-422d-977e-a5a760f1df03
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:41:54.487000+00:00
-- started: 2026-07-31T12:41:54.593000+00:00
-- ended: 2026-07-31T12:41:54.723000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
