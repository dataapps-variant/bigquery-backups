-- job_id: cf972ab9-2109-4c4c-9dc6-774a9852b7b7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T12:50:25.650000+00:00
-- started: 2026-08-03T12:50:25.768000+00:00
-- ended: 2026-08-03T12:50:25.974000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
