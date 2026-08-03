-- job_id: ac24f64d-495b-49ee-b70e-6dc1fc001f0c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T13:02:15.092000+00:00
-- started: 2026-08-03T13:02:15.350000+00:00
-- ended: 2026-08-03T13:02:15.492000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
