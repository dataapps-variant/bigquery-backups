-- job_id: 9ffd29e9-767f-43ca-8c59-509c36c46c5f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:05:27.549000+00:00
-- started: 2026-07-30T13:05:27.712000+00:00
-- ended: 2026-07-30T13:05:27.824000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
