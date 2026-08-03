-- job_id: 8aea2187-0407-49f6-8d34-133b8b5f296c
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T23:53:01.006000+00:00
-- started: 2026-07-30T23:53:01.163000+00:00
-- ended: 2026-07-30T23:53:01.306000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
