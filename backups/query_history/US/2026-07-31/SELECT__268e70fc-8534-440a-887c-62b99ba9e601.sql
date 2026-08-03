-- job_id: 268e70fc-8534-440a-887c-62b99ba9e601
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:47:08.484000+00:00
-- started: 2026-07-31T12:47:08.603000+00:00
-- ended: 2026-07-31T12:47:08.810000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
