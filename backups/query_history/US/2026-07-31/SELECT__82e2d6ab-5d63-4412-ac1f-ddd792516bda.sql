-- job_id: 82e2d6ab-5d63-4412-ac1f-ddd792516bda
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:22:49.626000+00:00
-- started: 2026-07-31T11:22:49.700000+00:00
-- ended: 2026-07-31T11:22:49.808000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
