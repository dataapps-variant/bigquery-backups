-- job_id: 034abfdf-355a-4b43-8de6-3258f30553b8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T13:53:40.359000+00:00
-- started: 2026-07-30T13:53:40.484000+00:00
-- ended: 2026-07-30T13:53:40.586000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
