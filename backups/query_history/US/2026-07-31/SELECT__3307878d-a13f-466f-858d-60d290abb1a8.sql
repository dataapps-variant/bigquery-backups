-- job_id: 3307878d-a13f-466f-858d-60d290abb1a8
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:52:01.377000+00:00
-- started: 2026-07-31T10:52:01.530000+00:00
-- ended: 2026-07-31T10:52:01.690000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
