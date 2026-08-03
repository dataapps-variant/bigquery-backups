-- job_id: fea050f4-d390-4c6d-8f28-b984b4fba136
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T09:08:48.018000+00:00
-- started: 2026-07-30T09:08:48.158000+00:00
-- ended: 2026-07-30T09:08:48.331000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
