-- job_id: 9c368ad9-adbd-4fd4-be5d-d7e8f4b36b28
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:48:46.409000+00:00
-- started: 2026-07-30T12:48:46.586000+00:00
-- ended: 2026-07-30T12:48:46.783000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
