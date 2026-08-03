-- job_id: 4bb5af82-e27c-4221-9c86-5cd79898c456
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T14:00:21.454000+00:00
-- started: 2026-07-31T14:00:21.544000+00:00
-- ended: 2026-07-31T14:00:21.675000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
