-- job_id: a25f7b16-a401-44a8-a5b3-010c72f3f7df
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T14:01:37.566000+00:00
-- started: 2026-07-30T14:01:37.669000+00:00
-- ended: 2026-07-30T14:01:37.803000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
