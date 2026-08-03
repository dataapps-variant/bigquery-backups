-- job_id: 21c33d64-fc65-4f75-ab6b-09a647493189
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T11:09:34.262000+00:00
-- started: 2026-07-29T11:09:34.368000+00:00
-- ended: 2026-07-29T11:09:34.481000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
