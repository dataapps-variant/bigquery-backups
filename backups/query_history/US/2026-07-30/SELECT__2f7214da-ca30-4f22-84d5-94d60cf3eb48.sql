-- job_id: 2f7214da-ca30-4f22-84d5-94d60cf3eb48
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T15:31:40.025000+00:00
-- started: 2026-07-30T15:31:40.127000+00:00
-- ended: 2026-07-30T15:31:40.259000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
