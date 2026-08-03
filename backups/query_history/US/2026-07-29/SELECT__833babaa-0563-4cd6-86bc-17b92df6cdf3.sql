-- job_id: 833babaa-0563-4cd6-86bc-17b92df6cdf3
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:35:35.544000+00:00
-- started: 2026-07-29T17:35:35.649000+00:00
-- ended: 2026-07-29T17:35:35.782000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
