-- job_id: 37b9fa36-f247-4a9c-8184-ec0d6afad843
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T21:25:58.974000+00:00
-- started: 2026-07-30T21:25:59.095000+00:00
-- ended: 2026-07-30T21:25:59.197000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
