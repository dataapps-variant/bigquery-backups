-- job_id: 93f09281-5669-4f63-a7d3-a669239c7c06
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:09:04.667000+00:00
-- started: 2026-07-29T11:09:04.832000+00:00
-- ended: 2026-07-29T11:09:04.933000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
