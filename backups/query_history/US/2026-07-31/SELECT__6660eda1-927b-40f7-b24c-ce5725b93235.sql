-- job_id: 6660eda1-927b-40f7-b24c-ce5725b93235
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:36:12.472000+00:00
-- started: 2026-07-31T15:36:12.557000+00:00
-- ended: 2026-07-31T15:36:12.650000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
