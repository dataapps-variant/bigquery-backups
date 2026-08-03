-- job_id: 02de9f4f-f2b2-4bcf-bf64-9818458ad5f8
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:03:30.933000+00:00
-- started: 2026-07-31T10:03:31.042000+00:00
-- ended: 2026-07-31T10:03:31.319000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
