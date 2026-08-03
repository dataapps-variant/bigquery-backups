-- job_id: 82ec3c72-9e1a-40a6-b481-6c7e018cfe75
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:54:30.260000+00:00
-- started: 2026-08-03T12:54:30.407000+00:00
-- ended: 2026-08-03T12:54:30.611000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
