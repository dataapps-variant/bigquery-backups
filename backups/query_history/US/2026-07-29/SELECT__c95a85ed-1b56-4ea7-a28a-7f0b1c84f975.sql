-- job_id: c95a85ed-1b56-4ea7-a28a-7f0b1c84f975
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:14:49.149000+00:00
-- started: 2026-07-29T11:14:49.244000+00:00
-- ended: 2026-07-29T11:14:49.359000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
