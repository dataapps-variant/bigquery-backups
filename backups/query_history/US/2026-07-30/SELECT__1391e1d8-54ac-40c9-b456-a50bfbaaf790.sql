-- job_id: 1391e1d8-54ac-40c9-b456-a50bfbaaf790
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:01:38.669000+00:00
-- started: 2026-07-30T12:01:38.787000+00:00
-- ended: 2026-07-30T12:01:38.880000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
