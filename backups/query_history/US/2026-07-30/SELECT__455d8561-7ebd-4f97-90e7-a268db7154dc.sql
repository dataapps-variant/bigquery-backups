-- job_id: 455d8561-7ebd-4f97-90e7-a268db7154dc
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T13:47:42.243000+00:00
-- started: 2026-07-30T13:47:42.386000+00:00
-- ended: 2026-07-30T13:47:42.810000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
