-- job_id: f2cf8e35-07aa-4be2-95c1-6a19924af14b
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T12:50:23.512000+00:00
-- started: 2026-08-03T12:50:23.624000+00:00
-- ended: 2026-08-03T12:50:23.845000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
