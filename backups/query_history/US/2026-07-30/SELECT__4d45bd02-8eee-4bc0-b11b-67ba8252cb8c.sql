-- job_id: 4d45bd02-8eee-4bc0-b11b-67ba8252cb8c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:45:52.639000+00:00
-- started: 2026-07-30T13:45:52.790000+00:00
-- ended: 2026-07-30T13:45:52.888000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
