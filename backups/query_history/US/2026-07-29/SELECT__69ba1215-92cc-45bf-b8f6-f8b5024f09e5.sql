-- job_id: 69ba1215-92cc-45bf-b8f6-f8b5024f09e5
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:37:03.711000+00:00
-- started: 2026-07-29T17:37:03.804000+00:00
-- ended: 2026-07-29T17:37:03.925000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
