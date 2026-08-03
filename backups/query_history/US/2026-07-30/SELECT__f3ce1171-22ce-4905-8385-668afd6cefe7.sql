-- job_id: f3ce1171-22ce-4905-8385-668afd6cefe7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:48:40.402000+00:00
-- started: 2026-07-30T12:48:40.770000+00:00
-- ended: 2026-07-30T12:48:40.941000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
