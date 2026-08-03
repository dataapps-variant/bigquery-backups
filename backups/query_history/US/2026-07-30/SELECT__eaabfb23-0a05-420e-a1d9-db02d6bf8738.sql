-- job_id: eaabfb23-0a05-420e-a1d9-db02d6bf8738
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:50:46.834000+00:00
-- started: 2026-07-30T14:50:46.945000+00:00
-- ended: 2026-07-30T14:50:47.059000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
