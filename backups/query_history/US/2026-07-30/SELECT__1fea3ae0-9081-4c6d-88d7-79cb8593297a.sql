-- job_id: 1fea3ae0-9081-4c6d-88d7-79cb8593297a
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:00:37.287000+00:00
-- started: 2026-07-30T13:00:37.410000+00:00
-- ended: 2026-07-30T13:00:37.537000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
