-- job_id: df9a891e-ea12-4222-8157-1f663c0a3a93
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:19:56.030000+00:00
-- started: 2026-07-31T13:19:56.118000+00:00
-- ended: 2026-07-31T13:19:56.246000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
