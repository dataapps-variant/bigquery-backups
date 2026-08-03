-- job_id: d6c027d1-e3c8-4a8f-908f-734db9243852
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:13:42.732000+00:00
-- started: 2026-07-31T19:13:42.867000+00:00
-- ended: 2026-07-31T19:13:42.987000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
