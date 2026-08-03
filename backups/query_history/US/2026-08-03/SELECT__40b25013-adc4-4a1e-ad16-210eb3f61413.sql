-- job_id: 40b25013-adc4-4a1e-ad16-210eb3f61413
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:54:31.564000+00:00
-- started: 2026-08-03T12:54:31.674000+00:00
-- ended: 2026-08-03T12:54:32.185000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
