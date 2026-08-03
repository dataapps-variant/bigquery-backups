-- job_id: ede0dfc9-b23a-4e63-b37c-9f854f1a31ed
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T12:03:59.292000+00:00
-- started: 2026-07-29T12:03:59.421000+00:00
-- ended: 2026-07-29T12:03:59.551000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
