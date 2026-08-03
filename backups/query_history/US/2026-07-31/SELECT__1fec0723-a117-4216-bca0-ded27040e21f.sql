-- job_id: 1fec0723-a117-4216-bca0-ded27040e21f
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:47:13.517000+00:00
-- started: 2026-07-31T12:47:13.618000+00:00
-- ended: 2026-07-31T12:47:13.815000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
