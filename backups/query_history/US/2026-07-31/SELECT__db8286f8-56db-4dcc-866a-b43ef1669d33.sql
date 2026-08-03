-- job_id: db8286f8-56db-4dcc-866a-b43ef1669d33
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:03:29.648000+00:00
-- started: 2026-07-31T10:03:29.744000+00:00
-- ended: 2026-07-31T10:03:29.969000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
