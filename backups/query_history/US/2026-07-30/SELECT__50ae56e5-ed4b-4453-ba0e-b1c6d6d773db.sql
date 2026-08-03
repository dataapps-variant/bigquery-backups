-- job_id: 50ae56e5-ed4b-4453-ba0e-b1c6d6d773db
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:01:39.190000+00:00
-- started: 2026-07-30T12:01:39.318000+00:00
-- ended: 2026-07-30T12:01:39.423000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
