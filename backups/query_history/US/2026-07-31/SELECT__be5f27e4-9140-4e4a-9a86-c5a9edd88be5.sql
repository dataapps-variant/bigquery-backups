-- job_id: be5f27e4-9140-4e4a-9a86-c5a9edd88be5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T16:47:52.119000+00:00
-- started: 2026-07-31T16:47:52.206000+00:00
-- ended: 2026-07-31T16:47:52.330000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
