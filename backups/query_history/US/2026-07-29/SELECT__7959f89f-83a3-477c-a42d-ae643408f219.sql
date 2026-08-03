-- job_id: 7959f89f-83a3-477c-a42d-ae643408f219
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:08:31.640000+00:00
-- started: 2026-07-29T11:08:31.887000+00:00
-- ended: 2026-07-29T11:08:32.190000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
