-- job_id: 1da7a8cd-b2d1-4cbf-aebe-e9383a668f08
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:49:10.349000+00:00
-- started: 2026-07-29T14:49:10.455000+00:00
-- ended: 2026-07-29T14:49:10.556000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
