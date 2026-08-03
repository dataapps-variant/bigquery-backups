-- job_id: a2b0bc1c-9d06-4de1-9cf4-844f6a1b0507
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:01:40.043000+00:00
-- started: 2026-07-30T12:01:40.153000+00:00
-- ended: 2026-07-30T12:01:40.296000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
