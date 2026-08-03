-- job_id: 5c0d47a9-3779-47d3-8c77-afbf4903950b
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T17:53:08.669000+00:00
-- started: 2026-07-29T17:53:08.768000+00:00
-- ended: 2026-07-29T17:53:09.058000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
