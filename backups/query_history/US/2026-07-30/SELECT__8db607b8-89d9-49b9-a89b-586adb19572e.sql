-- job_id: 8db607b8-89d9-49b9-a89b-586adb19572e
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:35:42.892000+00:00
-- started: 2026-07-30T13:35:42.998000+00:00
-- ended: 2026-07-30T13:35:43.117000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
