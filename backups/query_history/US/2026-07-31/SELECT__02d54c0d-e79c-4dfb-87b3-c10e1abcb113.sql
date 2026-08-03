-- job_id: 02d54c0d-e79c-4dfb-87b3-c10e1abcb113
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:23.052000+00:00
-- started: 2026-07-31T10:51:23.153000+00:00
-- ended: 2026-07-31T10:51:23.358000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
