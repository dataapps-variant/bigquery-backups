-- job_id: cc76ae1f-db48-4a9c-bd12-c1ea33c38c46
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:48:20.350000+00:00
-- started: 2026-07-31T12:48:20.445000+00:00
-- ended: 2026-07-31T12:48:20.520000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
