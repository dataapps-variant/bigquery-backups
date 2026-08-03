-- job_id: d6b79814-cad0-41d1-9605-8fd097ed389e
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T13:34:01.928000+00:00
-- started: 2026-07-29T13:34:02.072000+00:00
-- ended: 2026-07-29T13:34:02.210000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
