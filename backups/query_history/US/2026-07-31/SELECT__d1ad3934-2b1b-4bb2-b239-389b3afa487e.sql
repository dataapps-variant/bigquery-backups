-- job_id: d1ad3934-2b1b-4bb2-b239-389b3afa487e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T13:26:32.095000+00:00
-- started: 2026-07-31T13:26:32.171000+00:00
-- ended: 2026-07-31T13:26:32.296000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
