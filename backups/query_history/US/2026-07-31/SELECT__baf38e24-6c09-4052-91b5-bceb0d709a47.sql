-- job_id: baf38e24-6c09-4052-91b5-bceb0d709a47
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:26:03.962000+00:00
-- started: 2026-07-31T13:26:04.060000+00:00
-- ended: 2026-07-31T13:26:04.204000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
