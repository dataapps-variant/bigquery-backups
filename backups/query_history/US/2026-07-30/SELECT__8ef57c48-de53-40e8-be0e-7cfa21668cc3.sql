-- job_id: 8ef57c48-de53-40e8-be0e-7cfa21668cc3
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:52:24.622000+00:00
-- started: 2026-07-30T13:52:24.748000+00:00
-- ended: 2026-07-30T13:52:24.869000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
