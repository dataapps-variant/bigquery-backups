-- job_id: 55c6d754-81b0-4f24-8a05-7c422a552c47
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:45:25.827000+00:00
-- started: 2026-07-29T11:45:25.944000+00:00
-- ended: 2026-07-29T11:45:26.061000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
