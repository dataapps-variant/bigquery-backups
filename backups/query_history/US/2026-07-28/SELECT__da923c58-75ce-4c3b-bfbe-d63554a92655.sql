-- job_id: da923c58-75ce-4c3b-bfbe-d63554a92655
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:04:48.145000+00:00
-- started: 2026-07-28T13:04:48.293000+00:00
-- ended: 2026-07-28T13:04:48.462000+00:00

SELECT `App_Name` AS a, COUNT(*) AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level` WHERE `App_Name` IS NOT NULL GROUP BY a ORDER BY c DESC
