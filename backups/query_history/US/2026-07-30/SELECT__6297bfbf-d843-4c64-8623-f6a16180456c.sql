-- job_id: 6297bfbf-d843-4c64-8623-f6a16180456c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:47:41.077000+00:00
-- started: 2026-07-30T13:47:41.161000+00:00
-- ended: 2026-07-30T13:47:41.316000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
