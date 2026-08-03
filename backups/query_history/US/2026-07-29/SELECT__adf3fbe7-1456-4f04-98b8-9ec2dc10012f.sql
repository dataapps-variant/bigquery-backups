-- job_id: adf3fbe7-1456-4f04-98b8-9ec2dc10012f
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:14:05.846000+00:00
-- started: 2026-07-29T13:14:05.947000+00:00
-- ended: 2026-07-29T13:14:06.077000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
