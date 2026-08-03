-- job_id: 45ea57ea-afd2-43bb-a2f6-9efb99553c5d
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:52:26.235000+00:00
-- started: 2026-07-30T13:52:26.333000+00:00
-- ended: 2026-07-30T13:52:26.448000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
