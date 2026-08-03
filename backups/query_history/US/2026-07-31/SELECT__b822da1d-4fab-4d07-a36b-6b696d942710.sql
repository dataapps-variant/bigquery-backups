-- job_id: b822da1d-4fab-4d07-a36b-6b696d942710
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:00:34.495000+00:00
-- started: 2026-07-31T13:00:34.615000+00:00
-- ended: 2026-07-31T13:00:34.735000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
