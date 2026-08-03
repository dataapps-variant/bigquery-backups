-- job_id: 326dd00d-28d5-4504-8e6e-dfe3b67443b2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:40.918000+00:00
-- started: 2026-07-29T11:45:40.968000+00:00
-- ended: 2026-07-29T11:45:41.197000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
