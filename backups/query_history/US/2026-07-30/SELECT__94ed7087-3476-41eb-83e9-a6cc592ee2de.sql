-- job_id: 94ed7087-3476-41eb-83e9-a6cc592ee2de
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:42:28.857000+00:00
-- started: 2026-07-30T16:42:28.954000+00:00
-- ended: 2026-07-30T16:42:29.109000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
