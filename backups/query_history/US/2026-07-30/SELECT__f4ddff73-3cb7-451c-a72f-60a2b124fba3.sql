-- job_id: f4ddff73-3cb7-451c-a72f-60a2b124fba3
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:42:30.038000+00:00
-- started: 2026-07-30T16:42:30.156000+00:00
-- ended: 2026-07-30T16:42:30.313000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
