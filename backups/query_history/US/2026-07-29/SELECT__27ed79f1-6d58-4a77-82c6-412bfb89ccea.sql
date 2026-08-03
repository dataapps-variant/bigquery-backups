-- job_id: 27ed79f1-6d58-4a77-82c6-412bfb89ccea
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:36:21.764000+00:00
-- started: 2026-07-29T11:36:21.871000+00:00
-- ended: 2026-07-29T11:36:22.057000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
