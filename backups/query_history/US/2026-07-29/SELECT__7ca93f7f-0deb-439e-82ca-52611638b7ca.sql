-- job_id: 7ca93f7f-0deb-439e-82ca-52611638b7ca
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:06:21.889000+00:00
-- started: 2026-07-29T12:06:21.983000+00:00
-- ended: 2026-07-29T12:06:22.116000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
