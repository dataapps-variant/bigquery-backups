-- job_id: 594db871-fa70-47d1-9dfd-a1c542c2de8c
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:51:28.911000+00:00
-- started: 2026-07-31T10:51:29.016000+00:00
-- ended: 2026-07-31T10:51:29.306000+00:00

SELECT `Plan_Name` AS p, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `Plan_Name` IS NOT NULL GROUP BY p ORDER BY c DESC
