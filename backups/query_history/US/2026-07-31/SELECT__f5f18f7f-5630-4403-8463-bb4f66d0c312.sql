-- job_id: f5f18f7f-5630-4403-8463-bb4f66d0c312
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:47:53.062000+00:00
-- started: 2026-07-31T16:47:53.156000+00:00
-- ended: 2026-07-31T16:47:53.293000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
