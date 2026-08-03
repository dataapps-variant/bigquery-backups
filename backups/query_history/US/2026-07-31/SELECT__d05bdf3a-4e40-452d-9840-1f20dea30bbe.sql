-- job_id: d05bdf3a-4e40-452d-9840-1f20dea30bbe
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T13:04:19.464000+00:00
-- started: 2026-07-31T13:04:19.583000+00:00
-- ended: 2026-07-31T13:04:19.713000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` WHERE `Cohort` = '7K_30D' AND `Table` = 'Regular' AND `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
