-- job_id: 6abaa141-5a5c-4627-8839-728c00e11050
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:52:06.894000+00:00
-- started: 2026-07-31T10:52:06.962000+00:00
-- ended: 2026-07-31T10:52:07.071000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
