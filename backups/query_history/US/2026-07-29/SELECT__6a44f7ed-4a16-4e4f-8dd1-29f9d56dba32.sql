-- job_id: 6a44f7ed-4a16-4e4f-8dd1-29f9d56dba32
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:49:10.260000+00:00
-- started: 2026-07-29T14:49:10.356000+00:00
-- ended: 2026-07-29T14:49:10.456000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
