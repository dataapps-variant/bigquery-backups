-- job_id: a53d83b2-073a-4a83-9cfd-b77506dbd7d9
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:05:16.532000+00:00
-- started: 2026-07-30T13:05:16.617000+00:00
-- ended: 2026-07-30T13:05:16.726000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
