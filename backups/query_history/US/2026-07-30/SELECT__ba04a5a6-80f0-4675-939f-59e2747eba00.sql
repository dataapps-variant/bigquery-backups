-- job_id: ba04a5a6-80f0-4675-939f-59e2747eba00
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:53:42.456000+00:00
-- started: 2026-07-30T13:53:42.558000+00:00
-- ended: 2026-07-30T13:53:42.666000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
